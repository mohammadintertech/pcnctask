import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/models/products.dart';
import 'package:pcnc_task/global/widgets/app_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProductItem extends StatefulWidget {
  ProductItem({required this.product});

  Product product;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 45.w,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Container(
              // color: Colors.green,
              width: double.infinity,
              child: AppImage(widget.product.images[0]),
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
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            widget.product.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '\$${widget.product.price}',
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            CupertinoIcons.heart,
                          ),
                          Icon(
                            CupertinoIcons.bookmark_fill,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.add_shopping_cart_sharp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class ProductItemShimmer extends StatefulWidget {
  @override
  State<ProductItemShimmer> createState() => _ProductItemShimmerState();
}

class _ProductItemShimmerState extends State<ProductItemShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 231, 231, 231),
      highlightColor: const Color.fromARGB(255, 255, 255, 255),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Colors.white,
          )),
    );
  }
}
