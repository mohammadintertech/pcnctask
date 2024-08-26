import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/drawer_icon.dart';
import 'package:pcnc_task/global/widgets/profile_icon.dart';
import 'package:sizer/sizer.dart';

class MyAppBarTitle extends StatefulWidget {
  final bool showProfileIcon;
  final bool showDarwerIcon;
  final bool showLogo;
  final String title;
  MyAppBarTitle(
      {required this.showDarwerIcon,
      required this.showLogo,
      required this.showProfileIcon,
      required this.title});
  @override
  State<MyAppBarTitle> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.showDarwerIcon
            ? AppDrawerButton()
            : Container(
                width: 10.w,
              ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.showLogo
                  ? SizedBox(
                      height: 5.h,
                      child: Image.asset('assets/images/dashboard.png'),
                    )
                  : Container(),
              Text(
                widget.title,
                style: AppTextStyles.appBarTitle,
              )
            ],
          ),
        ),
        widget.showProfileIcon
            ? ProfileIcon()
            : Container(
                width: 10.w,
              ),
      ],
    );
  }
}
