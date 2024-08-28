import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/shopping/controllers/categories_provider.dart';
import 'package:pcnc_task/features/shopping/widgets/circle_cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/white_button.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';

class CatSection extends StatefulWidget {
  const CatSection({super.key});

  @override
  State<CatSection> createState() => _CatSectionState();
}

class _CatSectionState extends State<CatSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getCategories();
  }

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
        Consumer<CategoryProvider>(builder: (_, provider, child) {
          return SizedBox(
            height: 11.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CircleCatItem(
                    showSimmer: provider.isLoadingCats,
                    cat: provider.isLoadingCats ? null : provider.cats[index]);
              },
              itemCount: provider.isLoadingCats
                  ? 10
                  : (provider.cats.length > 10 ? 10 : provider.cats.length),
            ),
          );
        })
      ],
    );
  }
}
