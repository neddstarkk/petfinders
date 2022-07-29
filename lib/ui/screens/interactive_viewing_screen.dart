import 'package:flutter/material.dart';

class InteractiveViewingScreen extends StatelessWidget {
  Image image;
  InteractiveViewingScreen({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: InteractiveViewer(child: image)),);
  }
}