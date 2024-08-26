import 'package:flutter/material.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:sizer/sizer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red,
              width: 10.w,
              height: 10.w,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: Image.asset('assets/images/dashboard.png'),
                  ),
                  Text(
                    'PCNC',
                    style: AppTextStyles.appBarTitle,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.red,
              width: 10.w,
              height: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
