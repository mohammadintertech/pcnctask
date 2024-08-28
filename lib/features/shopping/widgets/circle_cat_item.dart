import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/models/category.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CircleCatItem extends StatelessWidget {
  CircleCatItem({
    required this.showSimmer,
    this.cat,
  });
  bool showSimmer = false;
  AppCategory? cat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 9.h,
        child: showSimmer
            ? Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 231, 231, 231),
                    highlightColor: const Color.fromARGB(255, 255, 255, 255),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 8.h,
                          width: 8.h,
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            : Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 8.h,
                      width: 8.h,
                      child: Image.network(
                        cat!.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.image),
                      ),
                    ),
                  ),
                  Text(
                    cat!.name,
                    overflow: TextOverflow.ellipsis,
                    // style: TextStyle(fontSize: ),
                  )
                ],
              ),
      ),
    );
  }
}
