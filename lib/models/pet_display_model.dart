import 'package:flutter/material.dart';

class PetDisplayModel {
  String name;
  String breed;
  String gender;
  int age;
  String image;
  bool adopted;
  int price;
  int uid;

  PetDisplayModel({required this.age, required this.breed, required this.gender, required this.name, required this.image, this.adopted=false, required this.uid, required this.price});

  PetDisplayModel.fromMap(Map<String, dynamic> res)
      : uid = res["uid"],
        name = res["name"],
        age = res["age"],
        breed = res["breed"],
        image = res["image"],
        gender = res["gender"],
        adopted = res["adopted"] == 1,
        price = res["price"];


  Map<String, Object?> toMap() {
    return {'uid': uid, 'name': name, 'age': age, 'breed': breed, 'image': image, 'gender': gender, 'adopted': adopted ? 1 : 0, 'price': price};
  }
}