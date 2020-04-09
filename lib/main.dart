import 'package:flutter/material.dart';
import 'splash.dart';
import 'selectmode.dart';
void main() {
  Function done = () {
    return 1;
  };
  Map<int, Widget> op = {1: LCO()};
  runApp(MaterialApp(
    home: SafeArea(
      child: AnimatedSplash(
        imagePath: 'images/LCO_transparent.png',
        home: LCO(),
        customFunction: done,
        duration: 2500,
        type: AnimatedSplashType.BackgroundProcess,
        outputAndHome: op,
      ),
    ),
  ));
}


