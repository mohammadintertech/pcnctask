import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/screens/sign_in_screen.dart';
import 'package:pcnc_task/features/auth/screens/sign_up_screen.dart';
import 'package:pcnc_task/features/bottom_nav/screens/nav_screen.dart';
import 'package:pcnc_task/features/shopping/screens/categories_screen.dart';
import 'package:pcnc_task/features/shopping/screens/dashboard_screen.dart';
import 'package:pcnc_task/features/shopping/screens/search_screen.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/', // Initial route
          routes: {
            '/': (context) => SignInScreen(),
            '/sign_up': (context) => SignUpScreen(),
            '/sign_in': (context) => SignInScreen(),
            '/nav_screen': (context) => NavScreen(),
            '/dashboard': (context) => DashBoardScreen(),
            '/cat': (context) => CatScreen(),
            '/search': (context) => SearchScreen(),
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
