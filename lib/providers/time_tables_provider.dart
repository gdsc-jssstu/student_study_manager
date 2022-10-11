import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/time_table.dart';
import 'package:hive/hive.dart';


class TimeTables with ChangeNotifier{
  List<TimeTable> _tt=[];//tt=time tables

  List<TimeTable> get getTimeTables{
    getTimeTablesFromDB();
    return [..._tt];
  }
  void getTimeTablesFromDB(){
    _tt = Hive.box('timeTables').values.toList().cast<TimeTable>();
  }
  void addTimeTable(TimeTable newTT){
    Hive.box('timeTables').add(newTT);
    notifyListeners();
  }
}