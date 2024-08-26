import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircleCatItem extends StatelessWidget {
  const CircleCatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        height: 8.h,
        width: 8.h,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
