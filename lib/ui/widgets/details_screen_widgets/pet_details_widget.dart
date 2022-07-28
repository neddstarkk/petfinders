import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_features_widget.dart';

import '../../../util/constants.dart';
import '../../../util/size_config.dart';

class PetDetailsWidget extends StatelessWidget {
  const PetDetailsWidget({Key? key}) : super(key: key);

  void adopt(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("You've now Adopted <Pet Name>"),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Go Back"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (SizeConfig.screenHeight! / 1.7) - 20,
      child: Container(
        height:
            SizeConfig.screenHeight! - (SizeConfig.screenHeight! / 1.7) + 20,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: kScaffoldBackgroundColor),
        padding: const EdgeInsets.only(
            left: 20.0, top: 25.0, bottom: 25.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Jenny",
                  style: kPetNameDetailsScreenTextStyle,
                ),
                Text(
                  "\$120",
                  style: kPetPriceDetailsScreenTextStyle,
                )
              ],
            ),
            Text(
              "Golden Retriever",
              style: kPetBreedDetailScreenTextStyle,
            ),
            const Spacer(),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PetFeatures(featureName: "Sex", featureValue: "Male"),
                  PetFeatures(featureName: "Age", featureValue: "1 year"),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: SizeConfig.screenWidth,
              child: FloatingActionButton.extended(
                backgroundColor: const Color(0xff703edb),
                onPressed: () {
                  adopt(context);
                },
                label: const Text("Adopt me"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
