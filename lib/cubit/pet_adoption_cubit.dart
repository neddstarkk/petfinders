import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petfinders/cubit/pet_adoption_states.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/repository/home_display_repository.dart';

class PetAdoptionCubit extends Cubit<PetAdoptionState> {
  PetAdoptionCubit(this.repository) : super(InitialState()) {
    getAllPets();
  }

  final HomeDisplayRepository repository;

  getAllPets() {
    try {
      emit(LoadingState());

      final pets = repository.getPets;

      emit(LoadedState(pets));
    }
    catch (e) {
      emit(ErrorState());
    }
  }
}