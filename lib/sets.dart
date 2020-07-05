import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'startexercise.dart';

class EnterSets extends StatefulWidget {
  EnterSets(
      {@required this.exerciseImages,
        @required this.exerciseNames,
        @required this.exerciseTimings,
        @required this.exerciseAudio,});

  final List<String> exerciseImages;

  final List<String> exerciseNames;

  final List<int> exerciseTimings;

  final List<String> exerciseAudio;

  @override
  _EnterSetsState createState() => _EnterSetsState();
}

class _EnterSetsState extends State<EnterSets> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: Padding(
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
                            color: Color(0xff9E9E9E),
                            fontSize: 20,
                            letterSpacing: 3.2,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.exerciseImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Color(0xff616161),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 16, 0, 16),
                                      child: ClipOval(
                                        child: Image.asset(
                                          widget.exerciseImages[index]
                                              .toString(),
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
                                          widget.exerciseNames[index]
                                              .toString(),
                                          style: TextStyle(
                                            color: Color(0xff9E9E9E),
                                            letterSpacing: 8,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          widget.exerciseTimings[index]
                                                  .toString() +
                                              ' mins',
                                          style: TextStyle(
                                              color: Color(0xff9E9E9E),
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
                    inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[\\.|\\ |\\-|\\,]')),],
                    controller: myController,
                    cursorColor: Colors.green,
                    style:
                        TextStyle(color: Color(0xff9E9E9E), letterSpacing: 1.5),
                    decoration: InputDecoration(
                      hoverColor: Colors.brown,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      hintText: 'Number Of Sets You Wants To Do Today.',
                      hintStyle: TextStyle(
                        color: Color(0xff9E9E9E),
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: RawMaterialButton(
                      onPressed: () {
                        int val = double.parse(myController.text).round();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartExercise(
                                  exerciseImages: widget.exerciseImages,
                                  exerciseNames: widget.exerciseNames,
                                  exerciseTimings: widget.exerciseTimings,
                                  exerciseAudio: widget.exerciseAudio,
                                  sets: val)),
                        );
                        myController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                        child: Text(
                          'CONFIRM',
                          style: TextStyle(
                              color: Color(0xff9E9E9E),
                              fontSize: 20,
                              letterSpacing: 8),
                        ),
                      ),
                      fillColor: Color(0xff424242),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
