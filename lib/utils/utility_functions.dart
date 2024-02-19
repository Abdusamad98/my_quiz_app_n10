import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/level_model.dart';
import 'package:my_quiz_app/utils/size/size_utils.dart';
import 'package:my_quiz_app/utils/styles.dart';

Widget getRichText(
  String text1,
  String text2,
) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: AppTextStyle.interRegular,
      children: <TextSpan>[
        TextSpan(
          text: text2,
          style: AppTextStyle.interBold,
        ),
      ],
    ),
  );
}

Widget getRichTextForCount(String text1, String text2, BuildContext context) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontWeight: FontWeight.w700, fontSize: 20.w),
      children: <TextSpan>[
        TextSpan(
          text: text2,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

String getMinutelyText(int timeInSeconds) {
  //1 hour > seconds > 0
  int min = timeInSeconds ~/ 60;
  int sec = timeInSeconds % 60;

  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

  return "$minute : $second";
}

LevelModel getLevelFromString(String level) {
  switch (level) {
    case "easy":
      {
        return LevelModel.easy;
      }
    case "hard":
      {
        return LevelModel.hard;
      }
    default:
      {
        return LevelModel.medium;
      }
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
