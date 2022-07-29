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
      List<PetDisplayModel> pets = await _databaseService.retrievePets();

      if (pets.isEmpty || pets.length != repository.getPets.length) {
        pets = await _insertPetsInDB();
      }

      repository.setPets = pets;

      emit(LoadedState(pets));
    } catch (e) {
      print("EXCEPTION: $e");
      emit(ErrorState());
    }
  }

  Future<List<PetDisplayModel>> _insertPetsInDB() async {
    List<PetDisplayModel> pets = repository.getPets;
    for (int i = 0; i < pets.length; i++) {
      await _databaseService.insertPet(pets[i]);
    }

    return pets;
  }

  adoptPet(int uid) async {
    List<PetDisplayModel> pets = repository.getPets;

    pets[pets.indexWhere((pet) => pet.uid == uid)].adopted = true;
    await _databaseService
        .updatePet(pets[pets.indexWhere((pet) => pet.uid == uid)]);

    repository.setPets = pets;

    getAllPets();
  }

  
  // Called during search functionality
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
