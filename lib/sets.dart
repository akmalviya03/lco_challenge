import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'startexercise.dart';

class enterSets extends StatefulWidget {
  enterSets(
      {@required this.exercise_images,
      @required this.exercise_names,
      @required this.exercise_timings,
      @required this.exercise_audio});

  final List<String> exercise_images;

  final List<String> exercise_names;

  final List<int> exercise_timings;

  final List<String> exercise_audio;

  @override
  _enterSetsState createState() => _enterSetsState();
}

class _enterSetsState extends State<enterSets> {
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
                        itemCount: widget.exercise_images.length,
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
                                          widget.exercise_images[index]
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
                                          widget.exercise_names[index]
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
                                          widget.exercise_timings[index]
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartExercise(
                                  exercise_images: widget.exercise_images,
                                  exercise_names: widget.exercise_names,
                                  exercise_timings: widget.exercise_timings,
                                  exercise_audio: widget.exercise_audio,
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
