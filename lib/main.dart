import 'package:flutter/material.dart';
import 'selectmode.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      theme: ThemeData(textSelectionHandleColor: Colors.green),
      home: Scaffold(
        body: LCO()
      ),
    ));
  });

}
