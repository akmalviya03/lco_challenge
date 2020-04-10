import 'package:flutter/material.dart';

class StartExercise extends StatefulWidget {
  StartExercise(
      {@required this.exercise_images,
        @required this.exercise_names,
        @required this.exercise_timings,
        @required this.exercise_audio});

  final List<String> exercise_images;

  final List<String> exercise_names;

  final List<int> exercise_timings;

  final List<String> exercise_audio;

  @override
  _StartExerciseState createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Container(

            )),
      ),
    );
  }
}
