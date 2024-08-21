import 'package:flutter/material.dart';
import 'package:pcnc_task/constants/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  Function onTap;
  String text;
  PrimaryButton({required this.onTap, required this.text});
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          widget.onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentColor, // Button background color

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 12), // Button padding
        ),
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
