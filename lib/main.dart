import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/study_materials.dart';
import 'package:hacktober_fest_app/providers/time_table.dart';
import 'package:hacktober_fest_app/screens/home_screen.dart';
import 'package:hacktober_fest_app/screens/remainders_screen.dart';
import 'package:hacktober_fest_app/screens/study_materials_screen.dart';
import 'package:hacktober_fest_app/screens/timetables_screen.dart';
import 'package:hacktober_fest_app/screens/todo_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<TimeTable>(TimeTableAdapter());
  Hive.registerAdapter<StudyMaterial>(StudyMaterialAdapter());
  await Hive.openBox<TimeTable>('timeTables');
  await Hive.openBox('remainders');
  await Hive.openBox('todos');
  await Hive.openBox<StudyMaterial>('studyMaterials');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        TimeTablesScreen.routeName: (ctx) => TimeTablesScreen(),
        RemaindersScreen.routeName: (ctx) => RemaindersScreen(),
        TodoScreen.routeName: (ctx) => TodoScreen(),
        StudyMaterialsScreen.routeName: (ctx) => StudyMaterialsScreen(),
      },
    );
  }
}
