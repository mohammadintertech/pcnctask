import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';

class RoundedTextField extends StatefulWidget {
  RoundedTextField(
      {this.hint,
      this.preIcon,
      this.isPass = false,
      required this.controller,
      required this.validator});
  Icon? preIcon;
  final bool isPass;
  String? Function(String?)? validator;
  String? hint;
  final TextEditingController controller;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool obSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPass ? obSecure : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint ?? "",
        filled: true,
        prefixIcon: widget.preIcon,
        fillColor: AppColors.textFieldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //   borderSide: BorderSide.none,
        // ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide:
              BorderSide(color: Color.fromARGB(255, 129, 129, 129), width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        suffixIcon: !widget.isPass
            ? const SizedBox()
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
