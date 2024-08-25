import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/bottom_nav/widgets/bar_item.dart';
import 'package:pcnc_task/features/shopping/screens/dashboard_screen.dart';
import 'package:sizer/sizer.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    DashBoardScreen(),
    DashBoardScreen(),
    DashBoardScreen(),
    DashBoardScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 20.h,
        color: Colors.red,
        child: Row(
          children: [
            BarItem(
              icon: Icon(Icons.home),
              isSelected: true,
              title: "Home",
            ),
          ],
        ),
      ),
    );
  }
}
