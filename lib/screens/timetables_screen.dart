import 'package:flutter/material.dart';

class TimeTablesScreen extends StatelessWidget {
  static const routeName='/time-tables-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time-Table"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        //TODO:Add new timetable feature to be added
      },),
      body: Center(
        child: Text("Time-Table Screen"),
      ),
    );
  }
}
