import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:my_quiz_app/models/subject_model.dart';
import 'package:my_quiz_app/utils/icons.dart';

class DataRepository {
  DataRepository._();

  static final DataRepository instance = DataRepository._();

  factory DataRepository() => instance;

  List<SubjectModel> allSubjects = [];

  Future<void> loadSubjects() async {
    String data = await rootBundle.loadString(AppImages.testData);
    var decodedData = jsonDecode(data);
    allSubjects = (decodedData["data"] as List?)
            ?.map((e) => SubjectModel.fromJson(e))
            .toList() ??
        [];

    // for (var t in (decodedData["data"] as List?) ?? []) {
    //   allSubjects.add(SubjectModel.fromJson(t));
    // }
  }
}
