import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/remainder.dart';
import 'package:hive/hive.dart';

class Remainders with ChangeNotifier{
  List<Remainder> _remainders=[];

  List<Remainder> get _getRemainders{
    getRemaindersFromDB();
    return [..._remainders];
  }

  void getRemaindersFromDB(){
    _remainders = Hive.box('remainders').values.toList().cast<Remainder>();
  }

  void addRemainder(Remainder newRemainder){
    Hive.box('remainders').add(newRemainder);
    notifyListeners();
  }
}