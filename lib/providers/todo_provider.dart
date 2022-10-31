import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/todo.dart';
import 'package:hive/hive.dart';

class Todos with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get getTodos {
    getTodosFromDB();
    return [..._todos];
  }

  void getTodosFromDB() {
    _todos = Hive.box('todos').values.toList().cast<Todo>();
  }

  void addTodo(Todo newTodo) {
    Hive.box('todos').add(newTodo);
    notifyListeners();
  }
}
