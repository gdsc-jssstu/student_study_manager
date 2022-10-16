import 'package:flutter/material.dart';

class NoteScreenCont extends StatelessWidget {
  final String title;
  const NoteScreenCont({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30,15,30,15),
        child: Container(
          height: 80,
          width: double.infinity,
          //color: Color(0xff7DC9FF),
          decoration: const BoxDecoration(
            color: Color(0xff7DC9FF),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(child: Text(title,style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),)),
        ),
      ),
    );

  }
}
