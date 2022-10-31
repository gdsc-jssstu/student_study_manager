import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/study_materials.dart';
import 'package:hacktober_fest_app/providers/todo.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _todo;

  Future submitData() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      Hive.box<Todo>('todos').add(Todo(text: _todo.toString()));
      Navigator.of(context).pop();
    }
    print('Something is wrong');
  }

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
          "Add a Todo",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Form(
            key: _formKey,
            child: TextFormField(
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffC7E7FF),
                  label: Text("Type Here..."),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
              autocorrect: false,
              minLines: 2,
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  _todo = value;
                });
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffFFED8F),
        onPressed: () {
          submitData();
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        label: const SizedBox(width: 280, child: Icon(Icons.add)),
        //child: Icon(Icons.add),
      ),
    );
  }
}
