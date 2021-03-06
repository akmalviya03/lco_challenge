import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';
class BreakDialog extends StatefulWidget {
  @override
  _BreakDialogState createState() => _BreakDialogState();
}

class _BreakDialogState extends State<BreakDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  String get showDialogTime {
    Duration duration =
        _animationController.duration * _animationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 40));
    _animationController.reverse(from: 1.0)
      ..whenComplete(() => Navigator.pop(context));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: kMediumGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Break Time Left',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kLightGreyColor,
                      fontSize: 20,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AnimatedBuilder(
                      animation: _animationController,
                      builder: (BuildContext context, Widget child) {
                        return Text(
                          showDialogTime,
                          style: TextStyle(
                              color: kLightGreyColor,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}