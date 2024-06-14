import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/subject_model.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    Key? key,
    required this.subjectModel,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  final String time;
  final VoidCallback onTap;
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Ink(
        decoration: BoxDecoration(
          color: subjectModel.color,
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              color: AppColors.C_162023.withOpacity(0.3),
              spreadRadius: 12,
              blurRadius: 10,
            )
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subjectModel.subjectName,
                      style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,
                        fontSize: 24.w,
                      ),
                    ),
                    Text(
                      time,
                      style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,
                        fontSize: 14.w,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subjectModel.level.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.white
                      ),
                    ),
                    Text(
                      subjectModel.questions.length.toString(),
                      style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,
                        fontSize: 15.w,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
