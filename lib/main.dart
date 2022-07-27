import 'package:flutter/material.dart';
import 'package:petfinders/util/constants.dart';

import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kScaffoldBackgroundColor),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}