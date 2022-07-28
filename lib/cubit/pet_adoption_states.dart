import 'package:equatable/equatable.dart';
import 'package:petfinders/models/pet_display_model.dart';

abstract class PetAdoptionState extends Equatable {}

class InitialState extends PetAdoptionState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PetAdoptionState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PetAdoptionState {
  LoadedState(this.pets);

  final List<PetDisplayModel> pets;

  @override
  List<Object> get props => [pets];
}

class ErrorState extends PetAdoptionState {
  @override
  List<Object> get props => [];
}