import 'package:flutter/material.dart';
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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
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
            return Container(
              height: 15.h,
              color: Colors.blue, // color of grid items
              child: Center(
                child: Text(
                  ' items[index]',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
