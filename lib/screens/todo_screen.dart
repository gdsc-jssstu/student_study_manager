import 'package:flutter/material.dart';
class TodoScreen extends StatelessWidget {
  static const routeName='/todo-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo's"),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //TODO:Add new todo feature to be added
        },
      ),
      body: const Center(child: Text("Todo Screen"),),
    );
  }
}
