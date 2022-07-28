import 'package:flutter/material.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_details_widget.dart';
import 'package:petfinders/util/constants.dart';
import 'package:petfinders/util/size_config.dart';

class DetailsScreen extends StatelessWidget {
  int index;
  PetDisplayModel pet;
  DetailsScreen({Key? key, required this.index, required this.pet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
            child: Hero(
              tag: "heroImage$index",
              child: Image(image: pet.image, fit: BoxFit.cover),
            ),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight! / 1.7,
          ),
        ),
        PetDetailsWidget(
          pet: pet,
          index: index,
        ),
        Positioned(
            top: kToolbarHeight,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
              child: BackButton(
                color: Colors.black,
              ),
            ))
      ]),
    );
  }
}
