import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class Remainder{
  @HiveField(0)
  String date;

  @HiveField(1)
  String time;

  @HiveField(2)
  String message;

  Remainder({required this.message,required this.time,required this.date});
}