import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/time_table.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddTimetable extends StatefulWidget {
  const AddTimetable({Key? key}) : super(key: key);

  @override
  State<AddTimetable> createState() => _AddTimetableState();
}

class _AddTimetableState extends State<AddTimetable> {
  final _formKey = GlobalKey<FormState>();
  XFile? _image;
  String? title;

  getImageByCamera() async {
    final image =
        await ImagePicker.platform.getImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  getImageByGallery() async {
    final image =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future submitData() async {
    final isVaild = await _formKey.currentState!.validate();
    if (isVaild) {
      Hive.box<TimeTable>('timetables')
          .add(TimeTable(title: title, imagePath: _image!.path));
      Navigator.of(context).pop();
    }
    print('something is wrong');
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
                  onChanged: (val) {
                    setState(() {
                      title = val;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: GestureDetector(
                onTap: () {},
                child: _image == null
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
                        ))
                    : Container(
                        child: Image.file(File(_image!.path)),
                        height: 280,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: GestureDetector(
                onTap: () {
                  getImageByCamera();
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
                        Icons.camera_alt,
                        size: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Camera",
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: GestureDetector(
                onTap: () {
                  getImageByGallery();
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
                        Icons.photo,
                        size: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Gallery",
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
