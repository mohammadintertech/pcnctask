import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  static TextStyle header =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp);

  static TextStyle underLine = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
  );
  static TextStyle section = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17.sp,
  );
  static TextStyle appBarTitle = TextStyle(
    color: AppColors.accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
  );

  static double navIconSize = 22.sp;
}
