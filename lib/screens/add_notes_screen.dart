import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/study_materials.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({Key? key}) : super(key: key);
  static const routeName = '/add-notes-screen';

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final _formKey = GlobalKey<FormState>();
  PlatformFile? pickedfile;
  String? _filename;
  String? _actualname;
  bool isLoading = false;
  File? fileToDisplay;

  getFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (result != null) {
        setState(() {
          _actualname = result!.files.first.name;
          pickedfile = result!.files.first;
          fileToDisplay = File(pickedfile!.path.toString());
        });
      }

      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future submitData() async {
    final isVaild = _formKey.currentState!.validate();
    if (isVaild) {
      Hive.box<StudyMaterial>('studyMaterials')
          .add(StudyMaterial(fileName: _filename, filePath: pickedfile!.path));
      Navigator.of(context).pop();
    }
    print('Something is wrong');
  }

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
          "Attach Files",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                "DESCRIPTION",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffC7E7FF),
                      label: Text("Type Here..."),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  autocorrect: false,
                  minLines: 2,
                  maxLines: 10,
                  onChanged: (value) {
                    setState(() {
                      _filename = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: GestureDetector(
                onTap: () {
                  getFile();
                },
                child: pickedfile == null
                    ? Container(
                        height: 280,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff8A8B8D),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.upload,
                          size: 150,
                        ),
                      )
                    : Container(
                        height: 280,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff8A8B8D),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(child: Text('$_actualname selected.')),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: GestureDetector(
                onTap: () {
                  getFile();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF3F0F0),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.document_scanner,
                        size: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Documents",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffFFED8F),
        onPressed: () {
          submitData();
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        label: const SizedBox(width: 280, child: Icon(Icons.add)),
        //child: Icon(Icons.add),
      ),
    );
  }
}
