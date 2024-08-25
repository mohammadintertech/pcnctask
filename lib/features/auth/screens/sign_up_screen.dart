import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/widgets/rounded_text_field.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Create an\naccount',
              style: AppTextStyles.header,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: RoundedTextField(
              hint: "Username",
              preIcon: Icon(Icons.person_2_sharp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: RoundedTextField(
              hint: "Email",
              preIcon: Icon(Icons.email),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: RoundedTextField(
              hint: "Password",
              preIcon: Icon(Icons.lock),
              isPass: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: RoundedTextField(
              hint: "Confirm Password",
              preIcon: Icon(Icons.lock),
              isPass: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text.rich(
              TextSpan(
                text: 'By clicking the ', // Default text style
                children: <TextSpan>[
                  TextSpan(
                      text: 'Register', // Word to color
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      )),
                  TextSpan(
                    text: ' button, you agree to the public offer.',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 30),
            child: PrimaryButton(onTap: () {}, text: "Create Account"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I Already Have an Account'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
                  style: AppTextStyles.underLine,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
