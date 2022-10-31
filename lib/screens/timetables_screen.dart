import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/time_table.dart';
import 'package:hacktober_fest_app/screens/add_timetable_screen.dart';
import 'package:hacktober_fest_app/screens/view_timetable_screen.dart';
import 'package:hacktober_fest_app/widgets/timetable_screen_container.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimeTablesScreen extends StatelessWidget {
  static const routeName = '/time-tables-screen';

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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AddTimetable()));

            //TODO:Add new notes feature to be added
          },
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<TimeTable>('timetables').listenable(),
            builder: (context, Box<TimeTable> box, _) {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (ctx, i) {
                    final timetable = box.getAt(i);
                    return Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => ViewTimeTable(
                                      title: timetable.title.toString(),
                                      imagePath: timetable.imagePath),
                                ),
                              );
                            },

                            // leading:
                            //     Image.file(File(timetable!.imagePath.toString())),
                            title: Text(timetable!.title.toString()),
                            contentPadding: const EdgeInsets.only(left: 160),
                            trailing: IconButton(
                              onPressed: () {
                                box.deleteAt(i);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ));
                  });
            },
          ),
        ));
  }
}
