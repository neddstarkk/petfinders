import 'package:flutter/material.dart';

class PetDisplayModel {
  String name;
  String breed;
  String gender;
  int age;
  dynamic image;
  bool adopted;

  PetDisplayModel({required this.age, required this.breed, required this.gender, required this.name, required this.image, this.adopted=false});
}