import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petfinders/cubit/pet_adoption_states.dart';
import 'package:petfinders/database/database_service.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/repository/home_display_repository.dart';

class PetAdoptionCubit extends Cubit<PetAdoptionState> {
  PetAdoptionCubit(this.repository) : super(InitialState()) {
    getAllPets();
  }

  final HomeDisplayRepository repository;
  final DatabaseService _databaseService = DatabaseService();

  get repo => repository;

  getAllPets() async {
    try {
      emit(LoadingState());
      List<PetDisplayModel> pets;
      pets = await _databaseService.retrievePets();

      emit(LoadedState(pets));
    } catch (e) {
      emit(ErrorState());
      print("EXCEPTION: $e");
    }
  }

  adoptPet(int uid) async {
    var pets = await _databaseService.retrievePets();

    pets[pets.indexWhere((pet) => pet.uid == uid)].adopted = true;
    int newSomething = await _databaseService
        .updatePet(pets[pets.indexWhere((pet) => pet.uid == uid)]);

    repository.setPets = pets;

    getAllPets();
  }

  List<String> getAllNames() {
    var pets = repository.getPets;
    List<String> names = [];

    for (int i = 0; i < pets.length; i++) {
      names.add(pets[i].name);
    }

    return names;
  }

  List<PetDisplayModel> getPetsWithName(String petName) {
    var pets = repository.getPets;
    List<PetDisplayModel> petsWithDesiredName = [];

    for (int i = 0; i < pets.length; i++) {
      if (pets[i].name.toLowerCase() == petName) {
        petsWithDesiredName.add(pets[i]);
      }
    }

    return petsWithDesiredName;
  }

  void updateDataRepositoryFromLocal() {}
}
