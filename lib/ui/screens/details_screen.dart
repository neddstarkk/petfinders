import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/ui/screens/interactive_viewing_screen.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_details_widget.dart';
import 'package:petfinders/util/constants.dart';
import 'package:petfinders/util/size_config.dart';

class DetailsScreen extends StatefulWidget {
  int index;
  PetDisplayModel pet;
  DetailsScreen({Key? key, required this.index, required this.pet})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Timer _everySecond;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _everySecond = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _everySecond.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          child: widget.pet.adopted
              ? ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Colors.grey, BlendMode.saturation),
                  child: Container(
                    child: Hero(
                      tag: "heroImage${widget.index}",
                      child: Image(
                          image: NetworkImage(widget.pet.image),
                          fit: BoxFit.cover),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight! / 1.7,
                  ),
                )
              : GestureDetector(
                // Works on non adopted pets
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InteractiveViewingScreen(tag: "heroImage${widget.index}",
                          image: Image(image: NetworkImage(widget.pet.image)),
                        ),
                      )),
                  child: Container(
                    child: Hero(
                      tag: "heroImage${widget.index}",
                      child: Image(
                          image: NetworkImage(widget.pet.image),
                          fit: BoxFit.cover),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight! / 1.7,
                  ),
                ),
        ),
        PetDetailsWidget(
          pet: widget.pet,
          index: widget.index,
        ),
        Positioned(
            top: kToolbarHeight,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: BackButton(
                color: Colors.black,
              ),
            ))
      ]),
    );
  }
}
