import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/bottom_nav/screens/nav_screen.dart';
import 'package:pcnc_task/features/shopping/controllers/products_provider.dart';
import 'package:pcnc_task/features/shopping/widgets/product_item.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TrendingProducts extends StatefulWidget {
  const TrendingProducts({super.key});

  @override
  State<TrendingProducts> createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  init() async {
    await Provider.of<ProductsProvider>(context, listen: false)
        .getTrendProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          return Consumer<ProductsProvider>(builder: (_, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Trending Products',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Last Date 29/02/22',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'View All',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.trend_products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductItem(
                            product: provider.trend_products[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
