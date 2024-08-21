import 'package:flutter/material.dart';
import 'package:pcnc_task/constants/text_styles.dart';
import 'package:pcnc_task/widgets/primary_button.dart';
import 'package:pcnc_task/widgets/rounded_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Welcome\nBack!',
              style: TextStyles.header,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: RoundedTextField(
              hint: "Username or Email",
              preIcon: Icon(Icons.person_2_sharp),
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Forget Password?'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 30),
            child: PrimaryButton(onTap: () {}, text: "Login"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create An Account?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                child: Text('Sign Up'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
