import 'package:flutter/material.dart';
import 'package:pcnc_task/features/shopping/widgets/circle_cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/white_button.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:sizer/sizer.dart';

class CatSection extends StatefulWidget {
  const CatSection({super.key});

  @override
  State<CatSection> createState() => _CatSectionState();
}

class _CatSectionState extends State<CatSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16, top: 8, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Categories",
                style: AppTextStyles.section,
              ),
              WhiteButton(
                  onTap: () {
                    print('object');
                    Navigator.pushNamed(context, "/cat");
                  },
                  text: "See All"),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CircleCatItem();
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
