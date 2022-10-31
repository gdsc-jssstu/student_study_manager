import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/widgets/todo_screen_checker.dart';
class TodoScreen extends StatelessWidget {
  static const routeName='/todo-screen';

  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 32,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 92,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: const Text(
          "To-Do List",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //TODO:Add new todo feature to be added
        },
      ),
      body:Column(
        children: [
          CircularCheckBox(checked: true, onChange: (bool checked) {  }, str: "Task one should be typed here",),
          CircularCheckBox(checked: true, onChange: (bool checked) {  }, str: "Task two should be typed here",),
          CircularCheckBox(checked: false, onChange: (bool checked) {  }, str: "Task Three should be typed here",),
          CircularCheckBox(checked: false, onChange: (bool checked) {  }, str: "Task Four should be typed here",),
          CircularCheckBox(checked: true, onChange: (bool checked) {  }, str: "Task Five should be typed here",),
        ],
      ) ,

    );
  }
}
