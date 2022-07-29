import 'package:petfinders/models/pet_display_model.dart';

// Data Source for this application
class HomeDisplayRepository {
  List<PetDisplayModel> availablePetsForAdoption = [
    PetDisplayModel(
        age: 1,
        uid: 1,
        price: 100,
        breed: "Golden Retriever",
        gender: "Female",
        name: "Grace",
        image:
            "https://www.akc.org/wp-content/uploads/2020/07/Golden-Retriever-puppy-standing-outdoors-500x486.jpg"),
    PetDisplayModel(
        age: 2,
        uid: 2,
        price: 110,
        breed: "Labrador Retriever",
        gender: "Female",
        name: "Jenny",
        image:
            "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F06%2F25%2Flabrador-retriever-yellow-sitting-275580695-2000.jpg"),
    PetDisplayModel(
        age: 3,
        uid: 3,
        price: 120,
        breed: "Bulldog",
        gender: "Male",
        name: "Bull",
        image:
            "https://c.files.bbci.co.uk/3EE4/production/_125400161_bulldoggettyimages-934316346.jpg"),
    PetDisplayModel(
        age: 4,
        uid: 4,
        price: 130,
        breed: "Siberian Husky",
        gender: "Female",
        name: "Coco",
        image:
            "https://media-be.chewy.com/wp-content/uploads/2021/06/01091720/Siberian-Husky_FeaturedImage.jpg"),
    PetDisplayModel(
        age: 5,
        uid: 5,
        price: 240,
        breed: "Pomeranian",
        gender: "Male",
        name: "Peanut",
        image:
            "https://highlandcanine.com/wp-content/uploads/2021/03/pomeranian-running-and-happy.jpg"),
    PetDisplayModel(
        age: 7,
        uid: 6,
        price: 300,
        breed: "Great Dane",
        gender: "Male",
        name: "Reaver",
        image:
            "https://vetstreet.brightspotcdn.com/dims4/default/531e3f0/2147483647/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F46%2F2d1f90a0d711e0a2380050568d634f%2Ffile%2FGreat-Danes-3-645mk062111.jpg"),
    PetDisplayModel(
        age: 8,
        uid: 7,
        price: 120,
        breed: "Doberman",
        gender: "Female",
        name: "Lucy",
        image:
            "https://s36700.pcdn.co/wp-content/uploads/2019/11/GettyImages-948013218.jpg.optimal.jpg"),
    PetDisplayModel(
        age: 2,
        uid: 8,
        price: 200,
        breed: "Border Collie",
        gender: "Female",
        name: "Grace",
        image:
            "https://cf.ltkcdn.net/dogs/images/std/284979-800x533-border-collie-breed.jpg"),
    PetDisplayModel(
        age: 10,
        uid: 9,
        price: 100,
        breed: "Golden Retriever",
        gender: "Male",
        name: "Tommy",
        image: "https://image.petmd.com/files/2022-06/golden-retriever.jpg"),
    PetDisplayModel(
        age: 5,
        breed: "Russell Terrier",
        gender: "Male",
        name: "Rocky",
        image:
            "https://dogtime.com/assets/uploads/gallery/jack-russel-terrier-dog-breed-pictures/2-face.jpg",
        uid: 10,
        price: 130),
    PetDisplayModel(
        age: 6,
        breed: "Golden Retriever",
        gender: "Female",
        name: "Nala",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Golden_Retriever_standing_Tucker.jpg/640px-Golden_Retriever_standing_Tucker.jpg",
        uid: 11,
        price: 200),
    PetDisplayModel(
        age: 3,
        breed: "Labrador Retriever",
        gender: "Female",
        name: "Kelly",
        image:
            "https://cdn.britannica.com/82/232782-050-8062ACFA/Black-labrador-retriever-dog.jpg",
        uid: 12,
        price: 90),
    PetDisplayModel(
        age: 4,
        breed: "Golden Shepherd",
        gender: "Female",
        name: "Froyo",
        image:
            "https://bloximages.newyork1.vip.townnews.com/stltoday.com/content/tncms/assets/v3/classifieds/9/bf/9bfac6f0-a985-11ea-8f66-9b1ed05fc2c8/5ede325e18e50.image.jpg?resize=667%2C500",
        uid: 13,
        price: 140),
    PetDisplayModel(
        age: 1,
        breed: "Fox Terrier",
        gender: "Male",
        name: "Milo",
        image:
            "https://cdn.britannica.com/02/198002-050-452BDBD2/West-Highland-White-Terrier.jpg",
        uid: 14,
        price: 110),
    PetDisplayModel(
        age: 2,
        breed: "Irish Terrier",
        gender: "Male",
        name: "Coco",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/5/56/IrishTerrierSydenhamHillWoods.jpg",
        uid: 15,
        price: 190),
  ];

  List<PetDisplayModel> get getPets => availablePetsForAdoption;

  set setPets(List<PetDisplayModel> pets) {
    availablePetsForAdoption = pets;
  }
}
