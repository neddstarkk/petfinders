import 'package:flutter/cupertino.dart';
import 'package:petfinders/models/pet_display_model.dart';

class HomeDisplayRepository {
  List<PetDisplayModel> availablePetsForAdoption = [
    PetDisplayModel(age: 1, breed: "Golden Retriever", gender: "Female", name: "Grace", image: NetworkImage("https://www.akc.org/wp-content/uploads/2020/07/Golden-Retriever-puppy-standing-outdoors-500x486.jpg")),
    PetDisplayModel(age: 2, breed: "Labrador Retriever", gender: "Female", name: "Jenny", image: NetworkImage("https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F06%2F25%2Flabrador-retriever-yellow-sitting-275580695-2000.jpg")),
    PetDisplayModel(age: 3, breed: "Bulldog", gender: "Male", name: "Bull", image: NetworkImage("https://c.files.bbci.co.uk/3EE4/production/_125400161_bulldoggettyimages-934316346.jpg")),
    PetDisplayModel(age: 4, breed: "Siberian Husky", gender: "Female", name: "Coco", image: NetworkImage("https://media-be.chewy.com/wp-content/uploads/2021/06/01091720/Siberian-Husky_FeaturedImage.jpg")),
    PetDisplayModel(age: 5, breed: "Pomeranian", gender: "Male", name: "Peanut", image: NetworkImage("https://highlandcanine.com/wp-content/uploads/2021/03/pomeranian-running-and-happy.jpg")),
    PetDisplayModel(age: 7, breed: "Great Dane", gender: "Male", name: "Reaver", image: NetworkImage("https://vetstreet.brightspotcdn.com/dims4/default/531e3f0/2147483647/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F46%2F2d1f90a0d711e0a2380050568d634f%2Ffile%2FGreat-Danes-3-645mk062111.jpg")),
    PetDisplayModel(age: 8, breed: "Doberman", gender: "Female", name: "Lucy", image: NetworkImage("https://s36700.pcdn.co/wp-content/uploads/2019/11/GettyImages-948013218.jpg.optimal.jpg")),
    PetDisplayModel(age: 2, breed: "Border Collie", gender: "Female", name: "Grace", image: NetworkImage("https://cf.ltkcdn.net/dogs/images/std/284979-800x533-border-collie-breed.jpg")),
    PetDisplayModel(age: 10, breed: "Golden Retriever", gender: "Male", name: "Tommy", image: NetworkImage("https://image.petmd.com/files/2022-06/golden-retriever.jpg")),
  ];

  List<PetDisplayModel> get getPets => availablePetsForAdoption;

  set setPets(List<PetDisplayModel> pets) {
    availablePetsForAdoption = pets;
  }
}