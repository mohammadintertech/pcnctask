import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle header =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 45);

  static TextStyle underLine = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
  );
}
