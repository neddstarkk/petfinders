import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinders/cubit/pet_adoption_cubit.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/repository/home_display_repository.dart';

class HistoryDisplayRepository {
  List<PetDisplayModel> populateHistory(BuildContext context) {
    List<PetDisplayModel> displayItems = [];
    HomeDisplayRepository list =
        BlocProvider.of<PetAdoptionCubit>(context).repo;

    var newList = list.getPets;

    for (int i = 0; i < newList.length; i++) {
      if (newList[i].adopted) {
        displayItems.add(newList[i]);
      }
    }

    return displayItems;
  }
}
