import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/auth/screens/sign_in_screen.dart';
import 'package:pcnc_task/features/auth/screens/sign_up_screen.dart';
import 'package:pcnc_task/features/bottom_nav/screens/nav_screen.dart';
import 'package:pcnc_task/features/shopping/screens/categories_screen.dart';
import 'package:pcnc_task/features/shopping/screens/dashboard_screen.dart';
import 'package:pcnc_task/features/shopping/screens/search_screen.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    //try to login
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => UserProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/', // Initial route
              routes: {
                '/': (context) => DashBoardScreen(),
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
            ));
      },
    );
  }
}
