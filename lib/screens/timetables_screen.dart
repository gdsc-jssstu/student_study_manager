import 'package:flutter/material.dart';

class TimeTablesScreen extends StatelessWidget {
  static const routeName='/time-tables-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time-Table"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
        //TODO:Add new timetable feature to be added
      },),
      body: const Center(
        child: Text("Time-Table Screen"),
      ),
    );
  }
}
