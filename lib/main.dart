import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectmovie/bloc/authentication_bloc.dart';
import 'package:projectmovie/bloc/login_bloc.dart';
import 'package:projectmovie/bloc/simple_bloc_observer.dart';
import 'package:projectmovie/events/authentication_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/screens/screens.dart';
import 'package:projectmovie/states/authentication_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: _userRepository)
          ..add(AuthenticationEventStarted()),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authenticationState) {
            if (authenticationState is AuthenticationStateSuccess) {
              return NavScreen(); // home page
            } else if (authenticationState is AuthenticationStateFailuer) {
              return BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(userRepository: _userRepository),
                child: LoginScreen(userRepository: _userRepository),
              );
            }
            return SplashScreen2();
          },
        ),
      ),
    );
  }
}
