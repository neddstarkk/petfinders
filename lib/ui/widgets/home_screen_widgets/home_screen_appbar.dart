import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinders/cubit/pet_adoption_cubit.dart';

import 'custom_search_delegate.dart';

class HomeScreenAppbar extends StatefulWidget with PreferredSizeWidget {
  HomeScreenAppbar({Key? key}) : super(key: key);

  @override
  State<HomeScreenAppbar> createState() => _HomeScreenAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeScreenAppbarState extends State<HomeScreenAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text("Petfinders", style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            List<String> allNames = BlocProvider.of<PetAdoptionCubit>(context).getAllNames();
            showSearch(context: context, delegate: CustomSearchDelegate(allNames: allNames));
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}