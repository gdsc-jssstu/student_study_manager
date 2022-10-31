import 'dart:io';

import 'package:flutter/material.dart';

class ViewTimeTable extends StatelessWidget {
  final String? title;
  final String? imagePath;
  const ViewTimeTable(
      {required this.imagePath, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title.toString())),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(File(imagePath!)),
        ),
      ),
    );
  }
}
