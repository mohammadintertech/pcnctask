import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  static TextStyle header =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 45.sp);

  static TextStyle underLine = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
  );
}
