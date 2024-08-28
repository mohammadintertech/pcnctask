import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfileIcon extends StatefulWidget {
  const ProfileIcon({super.key});

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await TokenManager().getAccessToken() == null) {
          Navigator.pushNamed(context, '/sign_in');
        } else {
          Navigator.pushNamed(context, '/profile');
        }
      },
      child: Container(
        width: 10.w,
        height: 10.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset('assets/images/profile.jfif'),
        ),
      ),
    );
  }
}
