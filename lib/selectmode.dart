import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LCO extends StatefulWidget {
  @override
  _LCOState createState() => _LCOState();
}

class _LCOState extends State<LCO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                      child: RawMaterialButton(
                        fillColor: Color(0xff616161),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/random.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'RANDOM',
                                style: TextStyle(
                                    color: Color(0xff9E9E9E),
                                    fontSize: 20,
                                    letterSpacing: 8),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
                      child: RawMaterialButton(
                        fillColor: Color(0xff616161),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/calendar.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'DAY WISE',
                                style: TextStyle(
                                    color: Color(0xff9E9E9E),
                                    fontSize: 20,
                                    letterSpacing: 8),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}