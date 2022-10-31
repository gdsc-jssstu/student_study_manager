import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
part 'todo.g.dart';

@HiveType(typeId: 2)
class Todo extends HiveObject with ChangeNotifier {
  @HiveField(0)
  String text;

  @HiveField(1)
  bool completed;

  Todo({required this.text, this.completed = false});

  void toggleCompleted() {
    completed = completed ? false : true;
    notifyListeners();
  }
}
