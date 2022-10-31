import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/screens/remainders_screen.dart';
import 'package:hacktober_fest_app/screens/study_materials_screen.dart';
import 'package:hacktober_fest_app/screens/timetables_screen.dart';
import 'package:hacktober_fest_app/screens/todo_screen.dart';
import 'package:hacktober_fest_app/widgets/home_screen_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName='/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(9.0),
        child: GestureDetector(
          onTap: () {
          },
          child: const Icon(
            Icons.menu,
            size: 32,
          ),
        ),
      ),
      //centerTitle: true,
      toolbarHeight: 92,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      shadowColor: Colors.transparent,
      title: const Text(
        "My Dashboard",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenCard(title: "Timetable",onPressed: (){
                  Navigator.of(context).pushNamed(TimeTablesScreen.routeName);
                }, icon: Icons.calendar_month,),
                const SizedBox(
                  width: 45,
                ),
                HomeScreenCard(title: "To-Do List",onPressed: (){
                  Navigator.of(context).pushNamed(TodoScreen.routeName);
                },icon: Icons.checklist),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenCard(title: "Remainders",onPressed: (){
                  Navigator.of(context).pushNamed(RemaindersScreen.routeName);
                }, icon: Icons.notifications_active),
                const SizedBox(
                  width: 45,
                ),
                HomeScreenCard(title: "Notes",onPressed: (){
                  Navigator.of(context).pushNamed(StudyMaterialsScreen.routeName);
                },icon: Icons.file_copy_sharp),
              ],
            )
          ],
        ),
      ),
    );
  }
}
