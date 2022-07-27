import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_features_widget.dart';

import '../../../util/constants.dart';
import '../../../util/size_config.dart';

class PetDetailsWidget extends StatelessWidget {
  const PetDetailsWidget({Key? key}) : super(key: key);

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
            Text("Golden Retriever", style: kPetBreedDetailScreenTextStyle,),
            Spacer(),
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
            Spacer(),
            Container(
              width: SizeConfig.screenWidth,
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xff703edb),
                onPressed: () {},
                label: const Text("Adopt me"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
