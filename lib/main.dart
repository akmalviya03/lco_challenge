import 'package:flutter/material.dart';
import 'package:lcochallenge/Constants.dart';
import 'package:lcochallenge/splashScreen.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      theme: ThemeData(textSelectionHandleColor: kGreenColor),
      home: Scaffold(
        body: SplashScreen()
      ),
    ));
  });

}
