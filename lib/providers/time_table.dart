import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
part 'time_table.g.dart';

@HiveType(typeId: 0)
class TimeTable extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? imagePath;

  TimeTable({required this.title, required this.imagePath});
}
