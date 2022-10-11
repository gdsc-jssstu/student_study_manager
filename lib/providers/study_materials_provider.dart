import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/study_materials.dart';
import 'package:hive/hive.dart';

class StudyMaterials with ChangeNotifier{
  List<StudyMaterial> _st=[];

  List<StudyMaterial> get getStudyMaterials{

    return [..._st];
  }
  void getStudyMaterialsFromDB(){
    _st=Hive.box('studyMaterials').values.toList().cast<StudyMaterial>();
  }

  void addStudyMaterial(StudyMaterial newMaterial){
    Hive.box('studyMaterial').add(newMaterial);
    notifyListeners();
  }
}