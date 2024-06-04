import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/level_model.dart';
import 'package:my_quiz_app/models/quiz_model.dart';
import 'package:my_quiz_app/utils/utility_functions.dart';

class SubjectModel {
  final String subjectName;
  final String description;
  final List<QuizModel> questions;
  final LevelModel level;
  final Color color;

  SubjectModel({
    required this.level,
    required this.questions,
    required this.subjectName,
    required this.color,
    required this.description,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      color: (json["color"] as String? ?? "F2954D").toColor(),
      description: (json["description"] as String? ?? ""),
      level: getLevelFromString(json["level"] as String? ?? "medium"),
      subjectName: json["subject_name"] as String? ?? "",
      questions: (json["questions"] as List?)
              ?.map((e) => QuizModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
