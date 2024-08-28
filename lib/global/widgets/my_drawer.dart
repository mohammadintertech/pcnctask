import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Provider.of<UserProvider>(context, listen: false).logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/sign_in',
                  (Route<dynamic> route) => false,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
