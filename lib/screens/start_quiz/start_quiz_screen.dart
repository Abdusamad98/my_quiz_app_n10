import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_quiz_app/models/subject_model.dart';
import 'package:my_quiz_app/screens/quiz/quiz_screen.dart';
import 'package:my_quiz_app/screens/widgets/global_appbar.dart';
import 'package:my_quiz_app/screens/widgets/global_button.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/icons.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';
import 'package:my_quiz_app/utils/utility_functions.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({
    super.key,
    required this.subjectModel,
  });

  final SubjectModel subjectModel;

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Testni boshlash',
      ),
      body: Column(
        children: [
          22.getH(),
          Expanded(
            child: Container(
              width: double.infinity,
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 32.w),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        children: [
                          Text(
                            "Yo'riqnomani o'qib chiqib testni boshlang!",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.interSemiBold.copyWith(
                              color: AppColors.textColor,
                              fontSize: 20.w,
                            ),
                          ),
                          15.getH(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(
                                color: AppColors.C_F2954D,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.w),
                                  child: Image.asset(AppImages.quiz),
                                ),
                                3.getH(),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 7.h),
                                    child: getRichText(
                                      "Fan: ",
                                      widget.subjectModel.subjectName,
                                    )),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  child: getRichText(
                                    "Qiyinlik darajasi: ",
                                    widget.subjectModel.level.name,
                                  ),
                                ),
                                9.getH(),
                              ],
                            ),
                          ),
                          25.getH(),
                          getRichText(
                            "Savollar soni: ",
                            " ${widget.subjectModel.questions.length}",
                          ),
                          12.getH(),
                          getRichText(
                            "Umumiy vaqt: ",
                            " ${widget.subjectModel.questions.length * 3}:00 min",
                          ),
                          12.getH(),
                          getRichText(
                            "",
                            "Yo'riqnoma",
                          ),
                          Text(
                            widget.subjectModel.description,
                            style: AppTextStyle.interRegular.copyWith(
                              fontSize: 14.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.C_273032,
                      borderRadius: BorderRadius.circular(40.h),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.w),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImages.timerLeft),
                              5.getW(),
                              Text(
                                " ${widget.subjectModel.questions.length * 3}:00 min",
                                style: AppTextStyle.interMedium.copyWith(
                                  fontSize: 16.w,
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: GlobalButton(
                            title: "Boshlash",
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return QuizScreen(
                                        subjectModel: widget.subjectModel);
                                  },
                                ),
                              );
                            },
                            color: AppColors.C_F2954D,
                          ),
                        ),
                        16.getW(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
