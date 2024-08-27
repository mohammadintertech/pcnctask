import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  Function onTap;
  String text;
  PrimaryButton({required this.onTap, required this.text});
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          isLoading = true;
          setState(() {});
          await widget.onTap();
          isLoading = false;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentColor, // Button background color

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 12), // Button padding
        ),
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                widget.text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
    );
  }
}
