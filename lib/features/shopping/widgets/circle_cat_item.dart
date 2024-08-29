import 'package:cached_network_image/cached_network_image.dart';
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
            : GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/products_by_cat',
                    arguments: cat,
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 8.h,
                        width: 8.h,
                        child: CachedNetworkImage(
                          imageUrl: cat!.image,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
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
      ),
    );
  }
}
