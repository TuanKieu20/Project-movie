import 'package:flutter/material.dart';
import 'package:projectmovie/screens/nav_screen.dart';
import 'package:splashscreen/splashscreen.dart';

// import 'package:splashscreen/splashscreen.dart';
class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: NavScreen(),
      title: Text(
        '\t\tWelcome To \nTK Movies App',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.white,
          fontFamily: 'DancingScript',
        ),
      ),
      image: Image.asset(
        "assets/images/logo_app.png",
        fit: BoxFit.cover,
        color: Colors.white,
      ),
      photoSize: 150,
      backgroundColor: Colors.white54,
      gradientBackground: LinearGradient(
        colors: [Colors.black, Colors.transparent],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      loaderColor: Colors.red,
    );
  }
}
