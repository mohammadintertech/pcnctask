import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/models/category.dart';
import 'package:pcnc_task/global/widgets/app_image.dart';
import 'package:sizer/sizer.dart';

class CatItem extends StatefulWidget {
  CatItem(this.cat);
  AppCategory cat;
  @override
  State<CatItem> createState() => _CatItemState();
}

class _CatItemState extends State<CatItem> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Container(
                    width: double.infinity,
                    child: AppImage(
                      widget.cat.image,
                    )
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     onError: (exception, stackTrace) {},
                    //     image: NetworkImage(
                    //       widget.cat.image,
                    //     ),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    )),
            Expanded(
                child: Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.cat.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
