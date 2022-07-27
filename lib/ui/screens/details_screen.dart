import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_details_widget.dart';
import 'package:petfinders/util/constants.dart';
import 'package:petfinders/util/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Positioned(
            top: 0,
            child: Container(
              child: const Image(
                  image: NetworkImage(
                      "https://www.akc.org/wp-content/uploads/2020/07/Golden-Retriever-puppy-standing-outdoors-500x486.jpg"),
                  fit: BoxFit.cover),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight! / 1.7,
            ),
          ),
          const PetDetailsWidget(),
        ]),
      ),
    );
  }
}
