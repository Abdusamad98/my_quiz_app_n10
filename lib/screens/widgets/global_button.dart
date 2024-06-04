import 'package:flutter/material.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.withBorder = false,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.w),
        border: Border.all(
          width: 1,
          color: withBorder ? color : Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.interSemiBold.copyWith(
              fontSize: 16.w,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
