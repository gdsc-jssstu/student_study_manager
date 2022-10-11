import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/screens/remainders_screen.dart';
import 'package:hacktober_fest_app/screens/study_materials_screen.dart';
import 'package:hacktober_fest_app/screens/timetables_screen.dart';
import 'package:hacktober_fest_app/screens/todo_screen.dart';
import 'package:hacktober_fest_app/widgets/home_screen_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName='/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeScreenCard(title: "Timetable\'s",onPressed: (){
                Navigator.of(context).pushNamed(TimeTablesScreen.routeName);
              },),
              HomeScreenCard(title: "Todo\'s",onPressed: (){
                Navigator.of(context).pushNamed(TodoScreen.routeName);
              },),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeScreenCard(title: "Remainder\'s",onPressed: (){
                Navigator.of(context).pushNamed(RemaindersScreen.routeName);
              },),
              HomeScreenCard(title: "Study Materials",onPressed: (){
                Navigator.of(context).pushNamed(StudyMaterialsScreen.routeName);
              },),
            ],
          )
        ],
      ),
    );
  }
}
