import 'package:flutter/material.dart';
class TodoScreen extends StatelessWidget {
  static const routeName='/todo-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo\'s"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //TODO:Add new todo feature to be added
        },
      ),
      body: Center(child: Text("Todo Screen"),),
    );
  }
}
