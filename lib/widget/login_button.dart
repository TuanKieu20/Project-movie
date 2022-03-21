import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  VoidCallback _onpress;
  LoginButton({Key key, VoidCallback onpress})
      : _onpress = onpress,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10.0),
        ),
        onPressed: _onpress,
        child: Text(
          "Login to your account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
