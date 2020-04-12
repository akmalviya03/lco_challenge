import 'package:flutter/material.dart';
import 'splash.dart';
import 'selectmode.dart';
import 'package:flutter/services.dart';
void main() {

  Function done = () {
    return 1;
  };
  Map<int, Widget> op = {1: LCO()};

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      theme: ThemeData(textSelectionHandleColor: Colors.green),
      home: Scaffold(
        body: SafeArea(
          child: AnimatedSplash(
            imagePath: 'images/LCO_transparent.png',
            home: LCO(),
            customFunction: done,
            duration: 2500,
            type: AnimatedSplashType.BackgroundProcess,
            outputAndHome: op,
          ),
        ),
      ),
    ));
  });

}
