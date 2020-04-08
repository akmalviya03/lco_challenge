import 'package:flutter/material.dart';

void main() => runApp(LCO());

class LCO extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          body: randomExercises()
          ),
        ),
    );
  }
}

class randomExercises extends StatefulWidget {
  @override
  _randomExercisesState createState() => _randomExercisesState();
}

class _randomExercisesState extends State<randomExercises> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Hello',),),
    );
  }
}
