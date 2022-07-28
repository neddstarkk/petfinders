import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/home_screen_widgets/home_screen_appbar.dart';
import 'package:petfinders/ui/widgets/home_screen_widgets/pet_display_grid.dart';

import '../../util/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeScreenAppbar(),
      body: PetDisplayGrid(),
    );
  }
}