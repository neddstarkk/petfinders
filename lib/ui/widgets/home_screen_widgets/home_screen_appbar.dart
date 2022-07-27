import 'package:flutter/material.dart';

class HomeScreenAppbar extends StatelessWidget with PreferredSizeWidget{
  const HomeScreenAppbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Icon(Icons.location_on, color: Colors.pink,),

      // TODO: Make this location dynamic
      title: Text("Los Angeles, CA", style: TextStyle(color: Colors.black),),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black,))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}