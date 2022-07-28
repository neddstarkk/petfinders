import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinders/cubit/pet_adoption_cubit.dart';
import 'package:petfinders/repository/home_display_repository.dart';
import 'package:petfinders/ui/bottom_navbar.dart';
import 'package:petfinders/util/constants.dart';

import 'ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({ Key? key }) : super(key: key);

  HomeDisplayRepository repository = HomeDisplayRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PetAdoptionCubit>(
      create: (context) => PetAdoptionCubit(repository),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: kScaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: const BottomNavBar(),
      ),
    );
  }
}