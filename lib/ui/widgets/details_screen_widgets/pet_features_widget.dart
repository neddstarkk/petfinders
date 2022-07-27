import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class PetFeatures extends StatelessWidget {
  String featureName;
  String featureValue;

  PetFeatures({Key? key, required this.featureName, required this.featureValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Color(0xfff0ebfb),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(featureName,
              style: kPetBreedHomeScreenTextStyle.copyWith(
                fontSize: 14,
              )),
        ),
        Center(
          child: Text(
            featureValue,
            style: TextStyle(fontSize: 16, color: Color(0xff703edb)),
          ),
        )
      ]),
    );
  }
}
