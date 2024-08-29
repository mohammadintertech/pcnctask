import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_section.dart';
import 'package:pcnc_task/features/shopping/widgets/circle_cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/dashboard_products_grid.dart';
import 'package:pcnc_task/features/shopping/widgets/product_item.dart';
import 'package:pcnc_task/features/shopping/widgets/search_field.dart';
import 'package:pcnc_task/features/shopping/widgets/white_button.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/app_bar.dart';
import 'package:pcnc_task/global/widgets/drawer_icon.dart';
import 'package:pcnc_task/global/widgets/my_drawer.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: MyDrawer(),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: MyAppBarTitle(
          showDarwerIcon: true,
          showLogo: false,
          showProfileIcon: false,
          title: "Search",
        ),
      ),
      body: Column(
        children: [
          SearchField(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                  mainAxisExtent: 30.h,
                ),
                itemBuilder: (context, index) {
                  // return ProductItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
