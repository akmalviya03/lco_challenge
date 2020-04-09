import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  Function done = () {
    return 1;
  };
  Map<int, Widget> op = {1: LCO()};
  runApp(MaterialApp(
    theme: ThemeData.dark(),
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

class LCO extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Hello'),
          ),
        ),
      ),
    );
  }
}
