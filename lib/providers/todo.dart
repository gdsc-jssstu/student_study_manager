import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class Todo with ChangeNotifier{
  @HiveField(0)
  String text;

  @HiveField(1)
  bool completed;

  Todo({required this.text,this.completed=false});

  void toggleCompleted(){
    completed=completed?false:true;
    notifyListeners();
  }
}