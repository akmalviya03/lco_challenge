import 'package:flutter/material.dart';

import 'Constants.dart';
import 'enterSetsRandom.dart';

class SelectionButton extends StatelessWidget {
  SelectionButton({@required this.imagePath,@required this.buttonText,@required this.randomButtonVisibility});

  final String imagePath;final String buttonText;

  final bool randomButtonVisibility;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kMediumGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Image.asset(imagePath),
            SizedBox(
              height: 20,
            ),
            Text(
              buttonText,
              style: TextStyle(
                  color: kLightGreyColor,
                  fontSize: 20,
                  letterSpacing: 8),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EnterSetsRandom(randomButtonVisibility: randomButtonVisibility,)),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}