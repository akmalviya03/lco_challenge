import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:quiver/async.dart';

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
  int j = 0;
  String exer_Time;
  String exer_img;
  int exer_sets;
  String exer_name;
  bool buttontoggle = true;
  int breakTime = 40;
  int min;
  int sec;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exer_Time = widget.exercise_timings[0].toString();
    exer_img = widget.exercise_images[0];
    exer_sets = 1;
    exer_name = widget.exercise_names[0];
  }

  void update() async {
    for (int i = 0; i < widget.sets; i++) {
      setState(() {
        exer_sets = (i + 1);
      });
      while (j < 5) {
        setState(() {
          exer_img = widget.exercise_images[j];
          exer_name = widget.exercise_names[j];
        });
        CountdownTimer(Duration(seconds: widget.exercise_timings[j]),
                Duration(seconds: 1))
            .listen((data) {})
              ..onData((data) {
                print(data.elapsed.inSeconds.toString());
                sec = data.elapsed.inSeconds.remainder(60);
                min = data.elapsed.inMinutes;
                setState(() {
                  exer_Time = min.toString() + ":" + sec.toString();
                });
              })
              ..onDone(() {
                if (j == 4 && exer_sets == widget.sets) {
                  showDialog(context: context, child: finalScreen());
                } else {
                  showDialog(context: context, child: BreakDialog());
                }
              });
        await Future.delayed(
            Duration(seconds: ((widget.exercise_timings[j]) + 40)));
        j++;
      }
      j = 0;
    }
  }

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
                              'SET-' + exer_sets.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: Text(
                              exer_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 70),
                            child: Text(
                              exer_Time,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 20,
                                letterSpacing: 8,
                              ),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: double.infinity,
                                maxWidth: double.infinity,
                                minHeight: 500,
                                minWidth: 500),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Color(0xff616161),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(80.0),
                              child: Image.asset(
                                exer_img.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Visibility(
                        visible: buttontoggle,
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              buttontoggle = false;
                            });
                            update();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                            child: Text(
                              "START",
                              style: TextStyle(
                                  color: Color(0xff9E9E9E),
                                  fontSize: 20,
                                  letterSpacing: 8),
                            ),
                          ),
                          fillColor: Color(0xff424242),
                        ),
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

class BreakDialog extends StatefulWidget {
  @override
  _BreakDialogState createState() => _BreakDialogState();
}

class _BreakDialogState extends State<BreakDialog> {
  int val = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountdownTimer(Duration(seconds: 40), Duration(seconds: 1))
        .listen((data) {})
          ..onData((data) {
            setState(() {
              val = data.elapsed.inSeconds;
            });
          })
          ..onDone(() {
            Navigator.pop(context);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Color(0xff616161),borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Text(
              val.toString(),
              style: TextStyle(color: Color(0xff9E9E9E), fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}

class finalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Color(0xff616161),borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Text(
              'Thank You',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff9E9E9E),fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
