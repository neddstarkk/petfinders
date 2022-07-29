import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class PetFeatures extends StatelessWidget {
  final String featureName;
  final String featureValue;

  const PetFeatures(
      {Key? key, required this.featureName, required this.featureValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
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
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 171, 150, 216)),
          ),
        )
      ]),
    );
  }
}
