import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_section.dart';
import 'package:pcnc_task/features/shopping/widgets/circle_cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/dashboard_products_grid.dart';
import 'package:pcnc_task/features/shopping/widgets/search_field.dart';
import 'package:pcnc_task/features/shopping/widgets/trending_producst.dart';
import 'package:pcnc_task/features/shopping/widgets/white_button.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/app_bar.dart';
import 'package:pcnc_task/global/widgets/drawer_icon.dart';
import 'package:pcnc_task/global/widgets/my_drawer.dart';
import 'package:sizer/sizer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: MyAppBarTitle(
          showDarwerIcon: true,
          showLogo: true,
          showProfileIcon: true,
          title: "PCNC",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchField(),
            CatSection(),
            SizedBox(
              height: 2.h,
            ),
            DashboardGrid(),
            TrendingProducts(),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
