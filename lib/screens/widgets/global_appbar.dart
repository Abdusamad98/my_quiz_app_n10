import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      title: Column(
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: AppColors.C_162023,
                      border: Border.all(color: AppColors.C_2F3739)),
                  child: Center(
                    child: SvgPicture.asset(AppImages.arrowBack),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: AppTextStyle.interMedium.copyWith(fontSize: 18.w),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 80.h);
}
