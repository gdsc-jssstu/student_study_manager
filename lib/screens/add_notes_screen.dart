import 'package:flutter/material.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({Key? key}) : super(key: key);
  static const routeName = '/add-notes-screen';
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
      body: Column(
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
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffC7E7FF),
                  label: Text("Type Here..."),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff8A8B8D),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(
                    Icons.upload,
                    size: 150,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: GestureDetector(
              onTap: () {},
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffFFED8F),
        onPressed: (){},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15),),
        ),
        label: const SizedBox(
            width: 280,
            child: Icon(Icons.add)),
        //child: Icon(Icons.add),
      ),
    );
  }
}
