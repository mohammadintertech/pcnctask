import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/bottom_nav/widgets/bar_item.dart';
import 'package:pcnc_task/features/shopping/screens/dashboard_screen.dart';
import 'package:pcnc_task/features/shopping/screens/search_screen.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    DashBoardScreen(),
    SearchScreen(),
    SearchScreen(),
    SearchScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: <Widget>[
          screens[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: Container(
                color: Colors.transparent,
                height: 10.h,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 5,
                                blurRadius: 20,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BarItem(
                                onTap: () {
                                  currentIndex = 0;
                                  setState(() {});
                                },
                                icon: CupertinoIcons.home,
                                isSelected: currentIndex == 0,
                                title: "Home",
                              ),
                              BarItem(
                                onTap: () {
                                  currentIndex = 1;
                                  setState(() {});
                                },
                                icon: CupertinoIcons.heart,
                                isSelected: currentIndex == 1,
                                title: "Wishlist",
                              ),
                              Container(
                                width: AppTextStyles.navIconSize,
                              ),
                              BarItem(
                                onTap: () {
                                  currentIndex = 2;
                                  setState(() {});
                                },
                                icon: CupertinoIcons.search,
                                isSelected: currentIndex == 2,
                                title: "Search",
                              ),
                              BarItem(
                                onTap: () {
                                  currentIndex = 3;
                                  setState(() {});
                                },
                                icon: CupertinoIcons.settings_solid,
                                isSelected: currentIndex == 3,
                                title: "Setting",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: AppTextStyles.navIconSize,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 17.w,
                        width: 17.w,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
