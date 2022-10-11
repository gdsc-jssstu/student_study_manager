import 'package:flutter/material.dart';

class StudyMaterialsScreen extends StatelessWidget {
  static const routeName='/study-materials-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Materials"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        //TODO:Add new notes feature to be added
      },),
      body: Center(
        child: Text("Study Materials Screen"),
      ),
    );
  }
}
