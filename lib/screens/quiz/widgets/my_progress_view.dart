import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/icons.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class MyProgressView extends StatelessWidget {
  const MyProgressView(
      {super.key,
      required this.title,
      required this.timeText,
      required this.progressValue});

  final String title;
  final String timeText;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          24.getH(),
          Row(
            children: [
              Text(
                title,
                style: AppTextStyle.interRegular.copyWith(
                  fontSize: 16.w,
                  color: AppColors.textColor.withOpacity(0.5),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppImages.clock),
              SizedBox(width: 5.w),
              Text(
                timeText,
                style: AppTextStyle.interMedium.copyWith(
                  fontSize: 16.w,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          8.getH(),
          LinearProgressIndicator(
            minHeight: 10,
            backgroundColor: AppColors.C_162023,
            borderRadius: BorderRadius.circular(8),
            color: AppColors.C_F2954D,
            value: progressValue,
          ),
          24.getH(),
        ],
      ),
    );
  }
}
