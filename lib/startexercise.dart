import 'package:flutter/material.dart';

class StartExercise extends StatefulWidget {
  StartExercise(
      {@required this.exercise_images,
      @required this.exercise_names,
      @required this.exercise_timings,
      @required this.exercise_audio,
      @required this.sets});

  final List<String> exercise_images;

  final List<String> exercise_names;

  final List<int> exercise_timings;

  final List<String> exercise_audio;

  final int sets;

  @override
  _StartExerciseState createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  int start_sets = 1;
  int breakTime = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: Text(
                              'SET-'+start_sets.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 100),
                            child: Text(
                              widget.exercise_names[start_sets-1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 8,
                              ),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(maxHeight: double.infinity,maxWidth: double.infinity,minHeight: 500,minWidth: 500),
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30),),color: Color(0xff616161),),
                            child: Padding(
                              padding: const EdgeInsets.all(80.0),
                              child: Image.asset(
                                widget.exercise_images[start_sets-1]
                                    .toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                            child: Text(
                              'BREAK:'+ breakTime.toString()+' s',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                          child: Text(
                            'START',
                            style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 8),
                          ),
                        ),
                        fillColor: Color(0xff424242),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
