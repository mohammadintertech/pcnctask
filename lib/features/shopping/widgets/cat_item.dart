import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CatItem extends StatefulWidget {
  const CatItem({super.key});

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
              // color: Colors.green,
              child: Image.network(
                'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                fit: BoxFit.cover,
              ),
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
                            'Women Printed Kurta',
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
