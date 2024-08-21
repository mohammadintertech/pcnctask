import 'package:flutter/material.dart';
import 'package:pcnc_task/constants/app_colors.dart';

class RoundedTextField extends StatefulWidget {
  RoundedTextField({this.hint, this.preIcon, this.isPass = false});
  Icon? preIcon;
  bool isPass;
  String? hint;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool obSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPass ? obSecure : false,
      decoration: InputDecoration(
        hintText: widget.hint ?? "",
        filled: true,
        prefixIcon: widget.preIcon,
        fillColor: AppColors.textFieldBackground,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 129, 129, 129)!, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
        ),
        suffixIcon: !widget.isPass
            ? SizedBox()
            : IconButton(
                icon: Icon(
                  !obSecure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obSecure = !obSecure;
                  });
                },
              ),
      ),
    );
  }
}
