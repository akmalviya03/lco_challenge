import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcochallenge/Constants.dart';
import 'startexercise.dart';
import 'package:lcochallenge/listclass.dart';
import 'package:flutter_icons/flutter_icons.dart';

class EnterSetsRandom extends StatefulWidget {

  EnterSetsRandom({@required this.randomButtonVisibility});
  final bool randomButtonVisibility;
  @override
  _EnterSetsRandomState createState() => _EnterSetsRandomState();
}

class _EnterSetsRandomState extends State<EnterSetsRandom> {
  List<String> exerciseImages;
  List<String> exerciseNames;
  List<int> exerciseTimings;
  List<String> exerciseAudio;
  bool _validate = false;
  ListClass listClassObject;
  void getExercises() {
    List temp;
    if(widget.randomButtonVisibility == true){
      temp = listClassObject.shuffleExerciseImagesTimings();
    }
    else{
    temp = listClassObject.dayWiseExercises();
    }
    exerciseImages = temp[0];
    exerciseNames = temp[1];
    exerciseTimings = temp[2];
    exerciseAudio = temp[3];
  }

  @override
  void initState() {
    super.initState();
    listClassObject = new ListClass();
    getExercises();
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkGreyColor,
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text(
                            'We Have Selected Some Exercises For You To Keep You Healthy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kLightGreyColor,
                              fontSize: 20,
                              letterSpacing: 3.2,
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exerciseImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: kMediumGreyColor,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 0, 16),
                                        child: ClipOval(
                                          child: Image.asset(
                                            exerciseImages[index].toString(),
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            exerciseNames[index].toString(),
                                            style: TextStyle(
                                              color: kLightGreyColor,
                                              letterSpacing: 8,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            exerciseTimings[index].toString() +
                                                ' mins',
                                            style: TextStyle(
                                                color: kLightGreyColor,
                                                letterSpacing: 8,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        BlacklistingTextInputFormatter(
                            new RegExp('[\\.|\\ |\\-|\\,]')),
                      ],
                      controller: myController,
                      cursorColor: kGreenColor,
                      style: TextStyle(
                          color: kLightGreyColor, letterSpacing: 1.5),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kGreenColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kGreenColor),
                        ),
                        hintText: 'Number Of Sets You Wants To Do Today.',
                        hintStyle: TextStyle(
                          color: kLightGreyColor,
                          letterSpacing: 1.5,
                        ),
                        errorText:
                            _validate ? 'Please Enter Number Of Sets You Wants To do.' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: RawMaterialButton(
                        onPressed: () {
                          if (myController.text.isEmpty) {
                            setState(() {
                              _validate = true;
                            });
                          } else {
                            setState(() {
                              _validate = false;
                            });
                            int totalSets =
                                double.parse(myController.text).round();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StartExercise(
                                      exerciseImages: exerciseImages,
                                      exerciseNames: exerciseNames,
                                      exerciseTimings: exerciseTimings,
                                      exerciseAudio: exerciseAudio,
                                      sets: totalSets)),
                            );
                          }
                          myController.clear();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                          child: Text(
                            'CONFIRM',
                            style: TextStyle(
                                color: kLightGreyColor,
                                fontSize: 20,
                                letterSpacing: 8),
                          ),
                        ),
                        fillColor: Color(0xff424242),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.randomButtonVisibility,
            child: Positioned(
              bottom: MediaQuery.of(context).size.height*0.13,
              right: MediaQuery.of(context).size.height*0.02,
              child: Container(
                height: MediaQuery.of(context).size.height*0.05,
                width: MediaQuery.of(context).size.height*0.05,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kGreenColor,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    color: kMediumGreyColor,
                    shape: BoxShape.circle
                ),

                child: IconButton(
                  color: kLightGreyColor,
                  onPressed: () {
                    setState(() {
                      getExercises();
                    });
                  },
                  icon: Icon(FontAwesome.random),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
