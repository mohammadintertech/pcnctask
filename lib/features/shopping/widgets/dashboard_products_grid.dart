import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/controllers/products_provider.dart';
import 'package:pcnc_task/features/shopping/models/products.dart';
import 'package:pcnc_task/features/shopping/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DashboardGrid extends StatefulWidget {
  const DashboardGrid({super.key});

  @override
  State<DashboardGrid> createState() => _DashboardGridState();
}

class _DashboardGridState extends State<DashboardGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  init() async {
    await Provider.of<ProductsProvider>(context, listen: false)
        .getRandomProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 8),
        // color: Colors.red,
        child: FutureBuilder<dynamic>(
            future: init(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: ((4 + 1) / 2).toInt() * (30.h + 8.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 8.0, // spacing between columns
                        mainAxisExtent: 30.h,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItemShimmer();
                      },
                    ));
              }
              return Consumer<ProductsProvider>(
                builder: (_, provider, child) {
                  return SizedBox(
                      height: (((provider.isLoadingRandomProducts
                                          ? 4
                                          : provider.random_products.length) +
                                      1) /
                                  2)
                              .toInt() *
                          (30.h + 8.0),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.isLoadingRandomProducts
                            ? 4
                            : provider.random_products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 8.0, // spacing between rows
                          crossAxisSpacing: 8.0, // spacing between columns
                          mainAxisExtent: 30.h,
                        ),
                        itemBuilder: (context, index) {
                          if (provider.isLoadingRandomProducts) {
                            return ProductItemShimmer();
                          }
                          return ProductItem(
                              product: provider.random_products[index]);
                        },
                      ));
                },
              );
            }));
  }
}
