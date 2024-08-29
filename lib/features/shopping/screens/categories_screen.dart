import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/controllers/categories_provider.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_section.dart';
import 'package:pcnc_task/features/shopping/widgets/circle_cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/dashboard_products_grid.dart';
import 'package:pcnc_task/features/shopping/widgets/search_field.dart';
import 'package:pcnc_task/features/shopping/widgets/white_button.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/app_bar.dart';
import 'package:pcnc_task/global/widgets/drawer_icon.dart';
import 'package:pcnc_task/global/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
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
          title: "Categories",
        ),
      ),
      body: Column(
        children: [
          SearchField(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Consumer<CategoryProvider>(
                builder: (_, provider, child) {
                  return GridView.builder(
                    itemCount: provider.cats.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                      mainAxisExtent: 30.h,
                    ),
                    itemBuilder: (context, index) {
                      return CatItem(provider.cats[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
