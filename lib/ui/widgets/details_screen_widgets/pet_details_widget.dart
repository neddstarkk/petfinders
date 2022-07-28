import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinders/cubit/pet_adoption_cubit.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_features_widget.dart';

import '../../../util/constants.dart';
import '../../../util/size_config.dart';

class PetDetailsWidget extends StatefulWidget {
  PetDisplayModel pet;
  int index;
  PetDetailsWidget({Key? key, required this.pet, required this.index})
      : super(key: key);

  @override
  State<PetDetailsWidget> createState() => _PetDetailsWidgetState();
}

class _PetDetailsWidgetState extends State<PetDetailsWidget> {
  void adopt(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("You've now Adopted ${widget.pet.name}"),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Go Back"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Positioned(
      top: (SizeConfig.screenHeight! / 1.7) - 20,
      child: Container(
        height:
            SizeConfig.screenHeight! - (SizeConfig.screenHeight! / 1.7) + 20,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isDarkMode ? Theme.of(context).scaffoldBackgroundColor : kScaffoldBackgroundColor
            ),
        padding: const EdgeInsets.only(
            left: 20.0, top: 25.0, bottom: 25.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.pet.name}",
                  style: kPetNameDetailsScreenTextStyle,
                ),
                const Text(
                  "\$120",
                  style: kPetPriceDetailsScreenTextStyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.pet.breed}",
                  style: kPetBreedDetailScreenTextStyle,
                ),
                widget.pet.adopted
                    ? Container(
                        decoration: BoxDecoration(color: Color(0xffeaf0e6), borderRadius: BorderRadius.circular(7.0)),
                        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                        margin: EdgeInsets.only(top: 3.0),
                        child: const Text(
                          "Adopted",
                          style: TextStyle(color: Color(0xff48711f)),
                        ),
                      )
                    : Container(),
              ],
            ),
            const Spacer(),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PetFeatures(
                      featureName: "Sex", featureValue: "${widget.pet.gender}"),
                  PetFeatures(
                      featureName: "Age",
                      featureValue: "${widget.pet.age} year"),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: SizeConfig.screenWidth,
              child: FloatingActionButton.extended(
                backgroundColor:
                    widget.pet.adopted ? Colors.grey : const Color(0xff703edb),
                onPressed: widget.pet.adopted
                    ? null
                    : () {
                        BlocProvider.of<PetAdoptionCubit>(context)
                            .adoptPet(widget.pet.uid);
                        setState(() {
                          // Called to re build the UI of the DetailsScreen to reflect immediate changes
                        });
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
