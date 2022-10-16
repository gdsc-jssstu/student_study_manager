import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/screens/add_timetable_screen.dart';
import 'package:hacktober_fest_app/widgets/timetable_screen_container.dart';
class TimeTablesScreen extends StatelessWidget {
  static const routeName='/time-tables-screen';

  const TimeTablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 32,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 92,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: const Text(
          "Timetable",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffFFED8F),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTimetable()),);
          //TODO:Add new notes feature to be added
        },
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            TimetableScreenContainer(title: "Class Room Timetable"),
            TimetableScreenContainer(title: "Home Timetable"),
            TimetableScreenContainer(title: "Monthly timetable"),
            TimetableScreenContainer(title: "Yearly Timetable"),
          ],
        ),
      ),
    );
  }
}
