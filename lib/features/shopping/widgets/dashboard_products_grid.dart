import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/widgets/product_item.dart';
import 'package:sizer/sizer.dart';

class DashboardGrid extends StatefulWidget {
  const DashboardGrid({super.key});

  @override
  State<DashboardGrid> createState() => _DashboardGridState();
}

class _DashboardGridState extends State<DashboardGrid> {
  List<int> products = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 8),
      // color: Colors.red,
      child: SizedBox(
        height: ((products.length + 1) / 2).toInt() * 30.h +
            ((products.length + 1) / 2).toInt() * 8.0,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            mainAxisExtent: 30.h,
          ),
          itemBuilder: (context, index) {
            return ProductItem();
          },
        ),
      ),
    );
  }
}
