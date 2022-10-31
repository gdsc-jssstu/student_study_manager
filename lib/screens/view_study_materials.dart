import 'dart:io';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class ViewStudyMaterial extends StatelessWidget {
  final String? filename;
  final String? filePath;
  const ViewStudyMaterial(
      {required this.filePath, required this.filename, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filename.toString())),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SfPdfViewer.file(File(filePath!)),
        ),
      ),
    );
  }
}
