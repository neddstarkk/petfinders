import 'package:flutter_test/flutter_test.dart';
import 'package:petfinders/models/pet_display_model.dart';

void main() {
  test("Pet Display Model converts to map", () {
    String? name;
    String? breed;
    String? gender;
    int? age;
    String? image;
    bool adopted = false;
    int? price;
    int? uid;

    final pet = PetDisplayModel(
      age: 3,
      breed: "Labrador Retriever",
      gender: "Female",
      name: "Kelly",
      image:
          "https://cdn.britannica.com/82/232782-050-8062ACFA/Black-labrador-retriever-dog.jpg",
      uid: 12,
      price: 90,
    );

    var map = pet.toMap();

    expect(map["uid"], 12);
  });

  test("Pet Display Model converts from map", () {
    String? name;
    String? breed;
    String? gender;
    int? age;
    String? image;
    bool adopted = false;
    int? price;
    int? uid;

    final pet = PetDisplayModel(
      age: 3,
      breed: "Labrador Retriever",
      gender: "Female",
      name: "Kelly",
      image:
          "https://cdn.britannica.com/82/232782-050-8062ACFA/Black-labrador-retriever-dog.jpg",
      uid: 12,
      price: 90,
    );

    var map = pet.toMap();

    expect(PetDisplayModel.fromMap(map).uid, pet.uid);
  });
  
}
