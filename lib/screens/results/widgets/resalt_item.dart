import 'package:flutter/material.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class ResultItems extends StatelessWidget {
  const ResultItems(
      {super.key,
      required this.numbers,
      required this.text,
      required this.color});

  final String numbers;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            numbers,
            style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Text(
            text,
            style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
