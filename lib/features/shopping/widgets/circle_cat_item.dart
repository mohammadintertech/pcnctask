import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircleCatItem extends StatelessWidget {
  const CircleCatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 8.h,
          width: 8.h,
          child: Image.network(
            "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
