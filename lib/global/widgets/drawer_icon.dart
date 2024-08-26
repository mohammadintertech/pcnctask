import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppDrawerButton extends StatefulWidget {
  const AppDrawerButton({super.key});

  @override
  State<AppDrawerButton> createState() => _AppDrawerButtonState();
}

class _AppDrawerButtonState extends State<AppDrawerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Container(
        width: 10.w,
        height: 10.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: AppColors.drawer),
        child: Icon(Icons.menu),
      ),
    );
  }
}
