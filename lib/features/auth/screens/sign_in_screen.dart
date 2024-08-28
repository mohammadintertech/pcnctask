import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/auth/widgets/rounded_text_field.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/primary_button.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  login() async {
    if (_formKey.currentState!.validate()) {
      if (isLoading) {
        return;
      }
      isLoading = true;

      await Provider.of<UserProvider>(context, listen: false)
          .login(emailController.text.trim(), passController.text, context);

      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Welcome\nBack!',
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
                  controller: emailController,
                  hint: "Username or Email",
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
                  controller: passController,
                  hint: "Password",
                  preIcon: Icon(Icons.lock),
                  isPass: true,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forget Password?'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: PrimaryButton(
                    onTap: () async {
                      await login();
                    },
                    text: "Login"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create An Account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child: Text('Sign Up', style: AppTextStyles.underLine),
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
