import 'dart:async';

import 'package:flutter/material.dart';

class ColorBloc {
  StreamController _streamController = StreamController<Color>.broadcast();
  Stream<Color> get colorStream => _streamController.stream;
  bool isCheck = false;
  void changeColor() {
    isCheck = !isCheck;
    _streamController.sink.add((isCheck == true) ? Colors.red : Colors.black);
  }

  void dispose() {
    _streamController.close();
  }
}
