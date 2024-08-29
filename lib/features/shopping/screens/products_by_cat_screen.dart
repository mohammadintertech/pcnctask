import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/controllers/categories_provider.dart';
import 'package:pcnc_task/features/shopping/controllers/products_provider.dart';
import 'package:pcnc_task/features/shopping/models/category.dart';
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
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductsByCatScreen extends StatefulWidget {
  ProductsByCatScreen();
  @override
  State<ProductsByCatScreen> createState() => _ProductsByCatScreenState();
}

class _ProductsByCatScreenState extends State<ProductsByCatScreen> {
  AppCategory? cat;
  init() async {
    cat = ModalRoute.of(context)!.settings.arguments as AppCategory;

    await Provider.of<ProductsProvider>(context, listen: false)
        .getProductsByCat(cat!.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
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
                title: cat!.name,
              ),
            ),
            body: Column(
              children: [
                SearchField(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Consumer<ProductsProvider>(
                      builder: (_, provider, child) {
                        return GridView.builder(
                          itemCount: provider.products_by_cat.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing: 8.0, // spacing between rows
                            crossAxisSpacing: 8.0, // spacing between columns
                            mainAxisExtent: 30.h,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(
                                product: provider.products_by_cat[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
