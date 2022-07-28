import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinders/cubit/pet_adoption_cubit.dart';
import 'package:petfinders/cubit/pet_adoption_states.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/ui/screens/details_screen.dart';
import 'package:petfinders/util/constants.dart';

class PetDisplayGrid extends StatelessWidget {
  List<PetDisplayModel>? list = [];
  PetDisplayGrid({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list!.isNotEmpty) {
      return GridView.builder(
        itemCount: list!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Expanded(
            child: PetDisplayGridItem(
              pets: list!,
              index: index,
            ),
          );
        },
      );
    }
    return BlocBuilder<PetAdoptionCubit, PetAdoptionState>(
      builder: ((context, state) {
        if (state is LoadingState) {
          return const Center(child: const CircularProgressIndicator());
        } else if (state is ErrorState) {
          return const Center(child: const Icon(Icons.close));
        } else if (state is LoadedState) {
          final pets = state.pets;

          return GridView.builder(
            itemCount: pets.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return PetDisplayGridItem(
                pets: pets,
                index: index,
              );
            },
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

class PetDisplayGridItem extends StatelessWidget {
  const PetDisplayGridItem({
    Key? key,
    required this.pets,
    required this.index,
  }) : super(key: key);

  final List<PetDisplayModel> pets;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      index: index,
                      pet: pets[index],
                    ))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "heroImage$index",
                  child: pets[index].adopted
                      ? Banner(
                          location: BannerLocation.topEnd,
                          message: "Adopted",
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                            child: Image(
                              image: pets[index].image,
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Image(
                          image: pets[index].image,
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        " ${pets[index].name} ",
                        style: kPetNameHomeScreenTextStyle,
                      ),
                      Text(
                        "(${pets[index].breed})",
                        style: kPetBreedHomeScreenTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 10.0, bottom: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
                    child: Text(
                      "${pets[index].gender}, ${pets[index].age} yrs",
                      style: const TextStyle(color: const Color(0xff703edb), fontSize: 10),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xfff0ebfb),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
