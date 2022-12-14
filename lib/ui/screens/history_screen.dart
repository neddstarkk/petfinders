import 'package:flutter/material.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/repository/history_display_repository.dart';
import 'package:petfinders/util/size_config.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryDisplayRepository repo = HistoryDisplayRepository();

  List<PetDisplayModel> display = [];

  @override
  Widget build(BuildContext context) {
    // This violates the SOLID principle
    display = repo.populateHistory(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "History of Adoptions",
          style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
        centerTitle: true,
      ),
      body: display.isEmpty
          ? Center(
              child: Text("No Pets adopted yet"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).focusColor),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal! * 7, vertical: SizeConfig.blockSizeVertical!),
                  height: SizeConfig.screenHeight! / 9,
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      height: SizeConfig.screenHeight! / 9,
                      width: 120,
                      child: Image(
                        image: NetworkImage(display[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          display[index].name,
                          style: TextStyle(
                              color: Theme.of(context).appBarTheme.foregroundColor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(display[index].breed, style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ]),
                );
              },
              itemCount: display.length,
            ),
    );
  }
}
