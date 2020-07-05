import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class finalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff616161),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.30,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Developed By: Abhishak Kumar Malviya',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff9E9E9E), fontSize: 26),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Challenged By: Hitesh Choudhary',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff9E9E9E), fontSize: 26),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}