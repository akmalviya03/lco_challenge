import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constants.dart';

class FinalScreen extends StatelessWidget {
  // _launchURL() async {
  //   const url = 'https://www.youtube.com/watch?v=VFrKjhcTAzE';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          child: Container(
            decoration: BoxDecoration(
                color: kMediumGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // RichText(
                    //   text: TextSpan(
                    //     text: 'Challenged By: ',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: kLightGreyColor,
                    //         fontSize: 22),
                    //     children: <TextSpan>[
                    //       TextSpan(
                    //         text: 'Hitesh Choudhary',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.w300, fontSize: 20),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    RichText(
                      text: TextSpan(
                        text: 'Developed By: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kLightGreyColor,
                            fontSize: 22),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sarthak',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //     width: double.maxFinite,
                    //     child: RaisedButton(
                    //
                    //       child: Text('Open Challenge Video',style: TextStyle(
                    //           color: Color(0xff616161),
                    //           fontSize: 20,
                    //           letterSpacing: 6),),
                    //       onPressed:(){
                    //         _launchURL();
                    //       },
                    //       color:Color(0xff212121),
                    //     )
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
