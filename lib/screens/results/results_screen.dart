import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_quiz_app/data/answer_report.dart';
import 'package:my_quiz_app/screens/quiz/quiz_screen.dart';
import 'package:my_quiz_app/screens/results/widgets/resalt_item.dart';
import 'package:my_quiz_app/screens/widgets/global_appbar.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.answerReport,
  });

  final AnswerReport answerReport;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Natijalar',
      ),
      body: Column(
        children: [
          Text(
            "To'g'ri javoblar soni:${widget.answerReport.trueAnswersCount}",
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 45),
          ),
          SizedBox(
            width: 110.h,
            height: 110.h,
            child: Stack(
              children: [
                SizedBox(
                  width: 110.h,
                  height: 110.h,
                  child: Transform.rotate(
                    angle: pi,
                    child: CircularProgressIndicator(
                      value: 0.7,
                      color: AppColors.C_F2954D,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 8.h,
                      backgroundColor: AppColors.C_F2954D.withOpacity(0.2),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: widget.answerReport.trueAnswersCount.toString(),
                      style: AppTextStyle.interSemiBold.copyWith(
                        fontSize: 27.w,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "/${widget.answerReport.totalQuestionsCount.toString()}\n natijangiz",
                          style: AppTextStyle.interRegular.copyWith(
                            fontSize: 13.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: ResultItems(
                      numbers: widget.answerReport.trueAnswersCount.toString(),
                      text: "To'g'ri javoblar",
                      color: Colors.redAccent)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 6,
                child: ResultItems(
                    numbers: widget.answerReport.trueAnswersCount.toString(),
                    text: "Xato javoblar",
                    color: Colors.green),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: ResultItems(
                      numbers: getMinutelyText(widget.answerReport.spentTime),
                      text: "Umumiy vaqt",
                      color: Colors.redAccent)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 6,
                child: ResultItems(
                    numbers: getMinutelyText(
                        widget.answerReport.averageTimeForEachAnswer),
                    text: "O'rtacha vaqt",
                    color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
