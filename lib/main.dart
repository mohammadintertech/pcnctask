import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pcnc_task/constants/app_colors.dart';
import 'package:pcnc_task/screens/auth/sign_in_screen.dart';
import 'package:pcnc_task/screens/auth/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          initialRoute: '/', // Initial route
          routes: {
            '/': (context) => SignInScreen(),
            '/sign_up': (context) => SignUpScreen(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            // Set the primary color
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors
                  .primaryColor, // This will override the primary color in the color scheme
            ),
          ),
        );
      },
    );
  }
}
