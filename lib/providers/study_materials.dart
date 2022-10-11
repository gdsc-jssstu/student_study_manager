import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class StudyMaterial{
  @HiveField(0)
  String fileName;
  
  @HiveField(1)
  String filePath;
  StudyMaterial({required this.fileName,required this.filePath});
}