import 'package:flutter/material.dart';
import 'package:petfinders/ui/widgets/home_screen_widgets/pet_display_grid.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<String> allNames;

  CustomSearchDelegate({required this.allNames});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final List<String> searchResults = allNames.where(
      (name) => name.toLowerCase().contains(
            query.toLowerCase(),
          ),
    ).toList();

    return PetDisplayGrid(list: [],);
  }
}
