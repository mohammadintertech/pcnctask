import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/auth/models/user.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/widgets/app_bar.dart';
import 'package:pcnc_task/global/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> getProfile() async {
    return await Provider.of<UserProvider>(context, listen: false).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        drawer: MyDrawer(),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: MyAppBarTitle(
            showDarwerIcon: true,
            showLogo: false,
            showProfileIcon: false,
            title: "Profile",
          ),
        ),
        body: FutureBuilder<bool>(
          future: getProfile(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return Selector<UserProvider, AppUser>(
                  selector: (_, provider) => provider.user,
                  builder: (_, user, __) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [Text('User name  : ${user.name} ')],
                      ),
                    );
                  });
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ));
  }
}
