import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectmovie/bloc/authentication_bloc.dart';
import 'package:projectmovie/bloc/register_bloc.dart';
import 'package:projectmovie/events/authentication_event.dart';
import 'package:projectmovie/events/register_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/states/register_state.dart';
import 'package:projectmovie/widget/widget.dart';
// import 'package:projectmovie/widget/widget.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;
  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  UserRepository get _userRepository => widget._userRepository;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isVaildEmailAndPassword && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    // ignore: empty_statements
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: _userRepository),
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, registerState) {
              if (registerState.isFailure) {
                print('Registration Failed');
              } else if (registerState.isSubmitting) {
                print('Registration in progress...');
              } else if (registerState.isSuccess) {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthencationEventLoggedIn());
              }
              return Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        // ignore: deprecated_member_use
                        autovalidate: true,
                        validator: (_) {
                          return !registerState.isValidEmail
                              ? 'Invalid Email'
                              : null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        autocorrect: false,
                        // ignore: deprecated_member_use
                        autovalidate: true,
                        validator: (_) {
                          return !registerState.isValidPassword
                              ? 'Invalid Password'
                              : null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        // controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          labelText: 'Enter Password again',
                        ),
                        obscureText: true,
                        autocorrect: false,
                        // ignore: deprecated_member_use
                        autovalidate: true,
                        validator: (_) {
                          return !registerState.isValidPassword
                              ? 'Invalid Password'
                              : null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      RegisterButton(onPressed: () {
                        if (isRegisterButtonEnabled(registerState)) {
                          _registerBloc.add(
                            RegisterEventPressed(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
