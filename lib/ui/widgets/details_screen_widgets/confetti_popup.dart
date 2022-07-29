import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/details_screen_widgets/pet_details_widget.dart';

class ConfettiPopup extends StatelessWidget {
  const ConfettiPopup({
    Key? key,
    required ConfettiController confettiController,
    required this.widget,
  }) : _confettiController = confettiController, super(key: key);

  final ConfettiController _confettiController;
  final PetDetailsWidget widget;

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: const [
        Colors.blue,
        Colors.green,
        Colors.red,
        Colors.orange,
        Colors.purple
      ],
      blastDirection: pi / 2,
      numberOfParticles: 50,
      child: AlertDialog(
        title: Text("You've now Adopted ${widget.pet.name}"),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"))
        ],
      ),
    );
  }
}
