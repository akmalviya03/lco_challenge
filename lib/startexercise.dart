import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:lcochallenge/BreakDialog.dart';
import 'package:lcochallenge/aboutDialog.dart';

class StartExercise extends StatefulWidget {
  StartExercise(
      {@required this.exerciseImages,
      @required this.exerciseNames,
      @required this.exerciseTimings,
      @required this.exerciseAudio,
      @required this.sets});

  final List<String> exerciseImages;

  final List<String> exerciseNames;

  final List<int> exerciseTimings;

  final List<String> exerciseAudio;

  final int sets;

  @override
  _StartExerciseState createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise>
    with SingleTickerProviderStateMixin {
  int exerciseNumber = 0;
  String exerciseImage;
  int exerciseSet;
  String exerciseName;
  bool buttonToggle = true;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  AnimationController _animationController;
  String get showExerciseTimer {
    Duration duration =
        _animationController.duration * _animationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(minutes: widget.exerciseTimings[exerciseNumber]));
    exerciseImage = widget.exerciseImages[exerciseNumber];
    exerciseSet = widget.sets;
    exerciseName = widget.exerciseNames[exerciseNumber];
    assetsAudioPlayer.loop = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    assetsAudioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void update() {
    assetsAudioPlayer.open(Audio(widget.exerciseAudio[exerciseNumber]));
    assetsAudioPlayer.play();
    assetsAudioPlayer.loop = true;
    _animationController.reverse(from: 1.0);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          exerciseNumber++;
          if (exerciseNumber > widget.exerciseImages.length - 1) {
            exerciseSet = exerciseSet - 1;
            if (exerciseSet == 0) {
              assetsAudioPlayer.stop();
              showDialog(context: context, child: FinalScreen());
            } else {
              exerciseNumber = 0;
              assetsAudioPlayer.stop();
              showDialog(context: context, child: BreakDialog()).then((value) {
                assetsAudioPlayer
                    .open(Audio(widget.exerciseAudio[exerciseNumber]));
                assetsAudioPlayer.play();
                assetsAudioPlayer.loop = true;
                exerciseImage = widget.exerciseImages[exerciseNumber];
                exerciseName = widget.exerciseNames[exerciseNumber];
                _animationController.duration =
                    Duration(minutes: widget.exerciseTimings[exerciseNumber]);
                _animationController.reverse(from: 1.0);
              });
            }
          } else {
            assetsAudioPlayer.stop();
            showDialog(context: context, child: BreakDialog()).then((value) {
              assetsAudioPlayer
                  .open(Audio(widget.exerciseAudio[exerciseNumber]));
              assetsAudioPlayer.play();
              assetsAudioPlayer.loop = true;
              exerciseImage = widget.exerciseImages[exerciseNumber];
              exerciseName = widget.exerciseNames[exerciseNumber];
              _animationController.duration =
                  Duration(minutes: widget.exerciseTimings[exerciseNumber]);
              _animationController.reverse(from: 1.0);
            });
          }
        });
      }
    });
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
                                'SET-' + exerciseSet.toString(),
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
                                exerciseName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff9E9E9E),
                                  fontSize: 20,
                                  letterSpacing: 8,
                                ),
                              ),
                            ),
                            AnimatedBuilder(
                                animation: _animationController,
                                builder: (BuildContext context, Widget child) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 16, 0, 70),
                                    child: Text(
                                      showExerciseTimer,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff9E9E9E),
                                        fontSize: 20,
                                        letterSpacing: 8,
                                      ),
                                    ),
                                  );
                                }),
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
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  exerciseImage.toString(),
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
                          visible: buttonToggle,
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                buttonToggle = false;
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
        ));
  }
}
