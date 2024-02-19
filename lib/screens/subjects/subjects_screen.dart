import 'package:flutter/material.dart';
import 'package:my_quiz_app/data/data_repository.dart';
import 'package:my_quiz_app/models/subject_model.dart';
import 'package:my_quiz_app/screens/start_quiz/start_quiz_screen.dart';
import 'package:my_quiz_app/screens/subjects/widgets/subject_item.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fanni tanlang",
          style: AppTextStyle.interSemiBold.copyWith(
            fontSize: 27.w,
          ),
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(DataRepository().allSubjects.length, (index) {
            SubjectModel subject = DataRepository().allSubjects[index];
            return SubjectItem(
              subjectModel: subject,
              time: "12:00",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return StartQuizScreen(
                        subjectModel: subject,
                      );
                    },
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }
}
