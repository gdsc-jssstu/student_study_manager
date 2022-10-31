import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';

part 'study_materials.g.dart';

@HiveType(typeId: 1)
class StudyMaterial extends HiveObject {
  @HiveField(0)
  String? fileName;

  @HiveField(1)
  String? filePath;
  StudyMaterial({required this.fileName, required this.filePath});
}
