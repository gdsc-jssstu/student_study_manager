
import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/screens/home_screen.dart';
import 'package:hacktober_fest_app/screens/remainders_screen.dart';
import 'package:hacktober_fest_app/screens/study_materials_screen.dart';
import 'package:hacktober_fest_app/screens/timetables_screen.dart';
import 'package:hacktober_fest_app/screens/todo_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('timeTables');
  await Hive.openBox('remainders');
  await Hive.openBox('todos');
  await Hive.openBox('studyMaterials');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(ctx)=>HomeScreen(),
        TimeTablesScreen.routeName:(ctx)=> TimeTablesScreen(),
        RemaindersScreen.routeName:(ctx)=> RemaindersScreen(),
        TodoScreen.routeName:(ctx)=>TodoScreen(),
        StudyMaterialsScreen.routeName:(ctx)=>StudyMaterialsScreen(),
      },
    );
  }
}
