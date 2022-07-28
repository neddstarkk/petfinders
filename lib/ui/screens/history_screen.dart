import 'package:flutter/material.dart';
import 'package:petfinders/models/pet_display_model.dart';
import 'package:petfinders/repository/history_display_repository.dart';

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
      body: display.isEmpty
          ? Center(
              child: Text("No Pets adopted yet"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(display[index].name),
                );
              },
              itemCount: display.length,
            ),
    );
  }
}
