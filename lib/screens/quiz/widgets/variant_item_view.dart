import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class VariantItemView extends StatelessWidget {
  const VariantItemView({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.variantText,
    required this.caption,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String variantText;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.C_F2954D : AppColors.C_273032,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16.w),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 20.w,
              ),
              child: Row(
                children: [
                  Text(
                    caption,
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.white,
                      fontSize: 17.w,
                    ),
                  ),
                  12.getW(),
                  Expanded(
                    child: Text(
                      variantText,
                      style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,
                        fontSize: 14.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
