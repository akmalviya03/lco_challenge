import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcochallenge/Constants.dart';
import 'package:lcochallenge/selectionButton.dart';
class SelectionMode extends StatefulWidget {
  @override
  _SelectionModeState createState() => _SelectionModeState();
}

class _SelectionModeState extends State<SelectionMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                      child: SelectionButton(imagePath: 'images/random.png',buttonText : 'RANDOM',randomButtonVisibility: true,),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
                      child: SelectionButton(imagePath: 'images/calendar.png',buttonText : 'DAY WISE',randomButtonVisibility: false,),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
