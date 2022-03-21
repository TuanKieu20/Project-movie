import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onpress;

  const PlayButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onpress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton.icon(
      padding: EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      color: Colors.white,
      onPressed: onpress,
      icon: Icon(icon),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
