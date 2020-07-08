import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lcochallenge/BreakDialog.dart';
import 'package:lcochallenge/aboutDialog.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'Constants.dart';

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
  String pause0rResumeButtonText = "PAUSE";

  AudioPlayer _audioPlayer;
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> update() async {
    playMusic(exerciseNumber);

      _animationController.reverse(from: 1.0);

      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          exerciseNumber++;
          if (exerciseNumber > widget.exerciseImages.length - 1) {
            exerciseSet = exerciseSet - 1;
            if (exerciseSet == 0) {
              stopMusic();
              showDialog(context: context, child: FinalScreen());
            } else {
              exerciseNumber = 0;
              breakAndResume(exerciseNumber);
            }
          } else {
            breakAndResume(exerciseNumber);
          }
        }
      });
  }

  void breakAndResume(int exerciseNumber){
    stopMusic();
    showDialog(context: context, child: BreakDialog()).then((value) {
      playMusic(exerciseNumber);
      setState(() {
        exerciseImage = widget.exerciseImages[exerciseNumber];
        exerciseName = widget.exerciseNames[exerciseNumber];
      });
      _animationController.duration =
          Duration(minutes: widget.exerciseTimings[exerciseNumber]);
      _animationController.reverse(from: 1.0);
    });
  }
  static void monitorNotificationStateHandler(AudioPlayerState value) {
    print("state => $value");
  }

  Future playMusic(int exerciseNumber) async {
    _audioPlayer = await AudioCache().loop(widget.exerciseAudio[exerciseNumber]);
    if (Platform.isIOS) {
      _audioPlayer
          .monitorNotificationStateChanges(monitorNotificationStateHandler);
    }
  }

  Future pauseMusic() async {
    await _audioPlayer.pause();
  }

  Future stopMusic() async {
    await _audioPlayer.stop();
  }

  Future resumeMusic() async {
    await _audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGreyColor,
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
                                'SETS LEFT-' + exerciseSet.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kLightGreyColor,
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
                                  color: kLightGreyColor,
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
                                        color: kLightGreyColor,
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
                                color: kMediumGreyColor,
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
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: Container(
                          width: double.maxFinite,
                          child: RawMaterialButton(
                            onPressed: () {
                              if (_animationController.isAnimating) {
                                setState(() {
                                  _animationController.stop();
                                  pauseMusic();
                                  pause0rResumeButtonText = "RESUME";
                                });
                              }
                              else{
                                setState(() {
                                  _animationController.reverse(
                                      from: _animationController.value == 0.0
                                          ? 1.0
                                          : _animationController.value);
                                  resumeMusic();
                                  pause0rResumeButtonText = "PAUSE";
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                              child: Text(
                                pause0rResumeButtonText,
                                style: TextStyle(
                                    color: kLightGreyColor,
                                    fontSize: 20,
                                    letterSpacing: 8),
                              ),
                            ),
                            fillColor: Color(0xff424242),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: Visibility(
                          visible: buttonToggle,
                          child: Container(
                            width: double.maxFinite,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  buttonToggle = false;
                                });
                                update();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 14, 0, 14),
                                child: Text(
                                  "START",
                                  style: TextStyle(
                                      color: kLightGreyColor,
                                      fontSize: 20,
                                      letterSpacing: 8),
                                ),
                              ),
                              fillColor: Color(0xff424242),
                            ),
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
