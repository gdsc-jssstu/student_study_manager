import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class TimeTable{
  @HiveField(0)
  String title;

  @HiveField(1)
  String imagePath;

  TimeTable({required this.title,required this.imagePath});
}