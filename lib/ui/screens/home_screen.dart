import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/home_screen_widgets/home_screen_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppbar(),
      body: ListView(),
    );
  }
}