import 'package:flutter/material.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
