import 'package:flutter/material.dart';
import 'package:my_quiz_app/data/answer_report.dart';
import 'package:my_quiz_app/models/quiz_model.dart';
import 'package:my_quiz_app/models/subject_model.dart';
import 'package:my_quiz_app/screens/quiz/widgets/my_progress_view.dart';
import 'package:my_quiz_app/screens/quiz/widgets/quiz_screen_appbar.dart';
import 'package:my_quiz_app/screens/quiz/widgets/quiz_screen_bottom.dart';
import 'package:my_quiz_app/screens/quiz/widgets/variant_item_view.dart';
import 'package:my_quiz_app/screens/results/results_screen.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int count = 0;

  List<QuizModel> questions = [];

  int activeIndex = 0;
  int selectedIndex = 0; //selectedIndex oladigan qiymatlari: 0,1,2,3,4

  Map<int, int> selectedAnswers = {};

  Future<void> _timerLogic() async {
    for (int i = questions.length * 10; i > 0; i--) {
      setState(() {
        count = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    _navigateToResultScreen();
  }

  @override
  void initState() {
    questions = widget.subjectModel.questions;

    for (int i = 0; i < questions.length; i++) {
      selectedAnswers[i] = 0;
    }

    _timerLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizScreenAppBar(
        title: widget.subjectModel.subjectName,
        submit: _navigateToResultScreen,
      ),
      body: Column(
        children: [
          MyProgressView(
            title: widget.subjectModel.subjectName,
            timeText: getMinutelyText(count),
            progressValue: count / (questions.length * 10),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: AppColors.C_162023,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.w),
                topRight: Radius.circular(40.w),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 36.h,
                      horizontal: 24.w,
                    ),
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Q.${activeIndex + 1}",
                          style: AppTextStyle.interSemiBold.copyWith(
                            fontSize: 20.w,
                          ),
                          children: [
                            TextSpan(
                              text: "/${questions.length}",
                              style: AppTextStyle.interMedium.copyWith(
                                fontSize: 14.w,
                              ),
                            )
                          ],
                        ),
                      ),
                      12.getH(),
                      Text(
                        questions[activeIndex].questionText,
                        style: AppTextStyle.interSemiBold.copyWith(
                          fontSize: 17.w,
                        ),
                      ),
                      14.getH(),
                      VariantItemView(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        isSelected: selectedIndex == 1,
                        variantText: questions[activeIndex].variant1,
                        caption: "A",
                      ),
                      VariantItemView(
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        isSelected: selectedIndex == 2,
                        variantText: questions[activeIndex].variant2,
                        caption: "B",
                      ),
                      VariantItemView(
                        onTap: () {
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                        isSelected: selectedIndex == 3,
                        variantText: questions[activeIndex].variant3,
                        caption: "C",
                      ),
                      VariantItemView(
                        onTap: () {
                          setState(() {
                            selectedIndex = 4;
                          });
                        },
                        isSelected: selectedIndex == 4,
                        variantText: questions[activeIndex].variant4,
                        caption: "D",
                      ),
                    ],
                  ),
                ),
                QuizScreenBottom(
                  previousButtonVisibility: activeIndex != 0,
                  nextButtonVisibility: activeIndex != questions.length - 1,
                  onPrevious: () {
                    if (activeIndex >= 1) {
                      activeIndex--;
                      selectedIndex = selectedAnswers[activeIndex]!;
                    }
                    setState(() {});
                  },
                  onNext: () {
                    selectedAnswers[activeIndex] = selectedIndex;
                    if (activeIndex < questions.length - 1) {
                      selectedIndex = 0;
                      activeIndex++;
                    }
                    setState(() {});
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  void _navigateToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResultsScreen(
            answerReport: AnswerReport(
              subjectModel: widget.subjectModel,
              selectedAnswers: selectedAnswers,
              spentTime: questions.length * 10 - count,
            ),
          );
        },
      ),
    );
  }
}

String getMinutelyText(int timeInSeconds) {
  //"01:10"
  //1 hour > seconds > 0
  int min = timeInSeconds ~/ 60;
  int sec = timeInSeconds % 60;

  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

  return "$minute : $second";
}
