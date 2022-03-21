import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectmovie/bloc/authentication_bloc.dart';
import 'package:projectmovie/bloc/login_bloc.dart';
import 'package:projectmovie/events/authentication_event.dart';
import 'package:projectmovie/events/login_event.dart';
import 'package:projectmovie/repositories/user_repository.dart';
import 'package:projectmovie/states/login_state.dart';
import 'package:projectmovie/widget/widget.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository _userRepository;
  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  bool check = false;
  bool isCheck = false;
  // ignore: unused_element
  UserRepository get _userRepository => widget._userRepository;
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(() {
      _loginBloc.add(LoginEventEmailChanged(email: _emailController.text));
    });
    _passwordController.addListener(() {
      _loginBloc
          .add(LoginEventPasswordChanged(password: _passwordController.text));
    });
  }

  bool get isPopulalated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  bool isLoginButtonEnabled(LoginState loginState) =>
      loginState.isVaildEmailAndPassword & isPopulalated &&
      !loginState.isSubmitting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocBuilder<LoginBloc, LoginState>(builder: (context, loginState) {
        if (loginState.isFailure) {
          print('Login failure');
          check = true;
        } else if (loginState.isSubmitting) {
          print('Logging in');
        } else if (loginState.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthencationEventLoggedIn());
        }
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_app.png',
                  color: Colors.white,
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    labelText: 'Enter your email',
                    // labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: deprecated_member_use
                  autovalidate: true,
                  autocorrect: false,
                  validator: (_) {
                    return loginState.isValidEmail
                        ? null
                        : 'Invalid Email Format';
                  },
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: (isCheck == true)
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off_outlined),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                    ),
                    labelText: 'Enter your password',
                  ),
                  obscureText: (isCheck == true) ? false : true,
                  // ignore: deprecated_member_use
                  autovalidate: true,
                  autocorrect: false,
                  validator: (_) {
                    return loginState.isValidPassword
                        ? null
                        : 'Invalid Password Format';
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      LoginButton(
                        onpress: isLoginButtonEnabled(loginState)
                            ? _onLoginEmailAndPassword
                            : null,
                      ),
                      RegisterUserButton(userRepository: _userRepository),
                    ],
                  ),
                ),
                Text(
                  "Tài khoản mật khẩu sai!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (check == true) ? Colors.red : Colors.black,
                      fontSize: 16.0),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _onLoginEmailAndPassword() {
    print(_userRepository.getUser());
    _loginBloc.add(LoginEventWidthEmailAndPasswordPressed(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}
