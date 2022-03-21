import 'package:flutter/material.dart';

class CommingSoon extends StatefulWidget {
  @override
  _CommingSoonState createState() => _CommingSoonState();
}

class _CommingSoonState extends State<CommingSoon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This is CommingSoon Screen",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
