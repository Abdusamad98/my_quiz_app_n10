import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quiz_app/screens/widgets/global_button.dart';
import 'package:my_quiz_app/utils/colors.dart';
import 'package:my_quiz_app/utils/icons.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

class QuizScreenAppBar extends StatelessWidget implements PreferredSize {
  const QuizScreenAppBar({
    Key? key,
    required this.submit,
    required this.title,
  }) : super(key: key);

  final VoidCallback submit;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: AppColors.C_273032),
      title: Column(
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
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
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: AppColors.C_273032,
              borderRadius: BorderRadius.circular(16.w),
              border: Border.all(
                width: 1,
                color: AppColors.C_F2954D,
              ),
            ),
            child: InkWell(
              onTap: submit,
              child: Center(
                child: Text(
                  "Tugatish",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 16.w,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 80.h);
}
