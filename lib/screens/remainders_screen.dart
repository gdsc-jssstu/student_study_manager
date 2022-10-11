import 'package:flutter/material.dart';

class RemaindersScreen extends StatelessWidget {
  static const routeName='/remainders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remainder's"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //TODO:Add new remainder feature to be added
        },
      ),
      body: const Center(child: Text("Remainder's Screen"),),
    );
  }
}
