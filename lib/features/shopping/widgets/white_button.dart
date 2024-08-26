import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class WhiteButton extends StatefulWidget {
  Function onTap;
  String text;
  WhiteButton({required this.onTap, required this.text});
  @override
  State<WhiteButton> createState() => _WhiteButtonState();
}

class _WhiteButtonState extends State<WhiteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 3, bottom: 3),
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 11.sp),
          ),
        ),
      ),
    );
  }
}
