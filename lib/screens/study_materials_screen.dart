import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/widgets/notes_screen_container.dart';
import 'package:hacktober_fest_app/screens/add_notes_screen.dart';
class StudyMaterialsScreen extends StatelessWidget {
  static const routeName = '/study-materials-screen';
  const StudyMaterialsScreen({super.key});

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 32,
              ),
            ),
          ),
        ],
        title: const Text(
          "Notes",
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
              MaterialPageRoute(builder: (context) => const AddNotesScreen()),);
          //TODO:Add new notes feature to be added
        },
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.only(left: 32.0),
              child:  Text(
                "SUBJECTS",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600 ,
                ),
              ),
            ),

            NoteScreenCont(title: "A"),
            NoteScreenCont(title: "B"),
            NoteScreenCont(title: "C"),
            NoteScreenCont(title: "D"),
            NoteScreenCont(title: "E"),
          ],
        ),
      ),
    );
  }
}
