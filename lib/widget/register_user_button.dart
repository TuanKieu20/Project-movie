import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectmovie/bloc/register_bloc.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/screens/register_screen.dart';

class RegisterUserButton extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterUserButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'New to Movies App ?',
          style: TextStyle(
              color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BlocProvider<RegisterBloc>(
                      create: (context) =>
                          RegisterBloc(userRepository: _userRepository),
                      child: RegisterScreen(userRepository: _userRepository));
                },
              ),
            );
          },
          child: Text(
            " Sign Up Now",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 16.0,
                fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
    //   return ButtonTheme(
    //     height: 45,
    //     // ignore: deprecated_member_use
    //     child: FlatButton(
    //       shape: new RoundedRectangleBorder(
    //           borderRadius: new BorderRadius.circular(10.0)),
    //       color: Colors.green,
    //       child: Text(
    //         'Register a new Account',
    //         style: TextStyle(fontSize: 16, color: Colors.white),
    //       ),
    //       onPressed: () {
    //         Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (context) {
    //               return BlocProvider<RegisterBloc>(
    //                   create: (context) =>
    //                       RegisterBloc(userRepository: _userRepository),
    //                   child: RegisterScreen(userRepository: _userRepository));
    //             },
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }
  }
}
