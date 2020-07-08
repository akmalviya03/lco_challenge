import 'package:flutter/material.dart';
import 'package:lcochallenge/Constants.dart';
import 'package:lcochallenge/splashScreen.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Setting up application orientation to portrait.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textSelectionHandleColor: kGreenColor),
      home: Scaffold(
        body: SplashScreen()
      ),
    ));
  });

}
