import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/auth/widgets/rounded_text_field.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/primary_button.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  signUp() async {
    if (_formKey.currentState!.validate()) {
      if (isLoading) {
        return;
      }
      isLoading = true;

      await Provider.of<UserProvider>(context, listen: false).signUp(
          emailController.text.trim(),
          passController.text,
          usernameController.text,
          context);

      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  validator: (str) {
                    if (str!.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  controller: usernameController,
                  hint: "Username",
                  preIcon: Icon(Icons.person_2_sharp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RoundedTextField(
                  validator: (str) {
                    if (str!.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  controller: emailController,
                  hint: "Email",
                  preIcon: Icon(Icons.email),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RoundedTextField(
                  validator: (str) {
                    if (str!.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  controller: passController,
                  hint: "Password",
                  preIcon: Icon(Icons.lock),
                  isPass: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RoundedTextField(
                  validator: (str) {
                    if (str!.isEmpty) {
                      return 'Field is empty';
                    } else if (str != passController.text) {
                      return 'Password not match';
                    }
                    return null;
                  },
                  controller: confirmPassController,
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
                child: PrimaryButton(
                    onTap: () async {
                      await signUp();
                    },
                    text: "Create Account"),
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
        ),
      ),
    );
  }
}
