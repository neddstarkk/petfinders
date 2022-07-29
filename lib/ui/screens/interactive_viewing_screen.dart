import 'package:flutter/material.dart';

class InteractiveViewingScreen extends StatelessWidget {
  Image image;
  String tag;
  InteractiveViewingScreen({Key? key, required this.image, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InteractiveViewer(child: Hero(tag: tag,child: image))),
    );
  }
}
