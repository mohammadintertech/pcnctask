import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';

class BarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function onTap;
  BarItem(
      {required this.onTap,
      required this.icon,
      required this.isSelected,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppTextStyles.navIconSize,
            color: isSelected ? AppColors.primaryColor : Colors.black,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
