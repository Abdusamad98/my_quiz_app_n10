import 'package:flutter/material.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class QuizScreenBottom extends StatelessWidget {
  const QuizScreenBottom({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.nextButtonVisibility,
    required this.previousButtonVisibility,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool nextButtonVisibility;
  final bool previousButtonVisibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 24.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: previousButtonVisibility,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  backgroundColor: AppColors.C_273032,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: onPrevious,
              child: Text(
                "Oldingisi",
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.C_BDBDBD),
              ),
            ),
          ),
          Visibility(
            visible: nextButtonVisibility,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  backgroundColor: AppColors.C_F2954D,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: onNext,
              child: Text(
                "Keyingisi",
                style: AppTextStyle.interSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
