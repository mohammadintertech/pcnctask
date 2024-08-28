import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/features/auth/models/user.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/cat_section.dart';
import 'package:pcnc_task/features/shopping/widgets/circle_cat_item.dart';
import 'package:pcnc_task/features/shopping/widgets/dashboard_products_grid.dart';
import 'package:pcnc_task/features/shopping/widgets/search_field.dart';
import 'package:pcnc_task/features/shopping/widgets/white_button.dart';
import 'package:pcnc_task/global/constants/app_colors.dart';
import 'package:pcnc_task/global/constants/text_styles.dart';
import 'package:pcnc_task/global/widgets/app_bar.dart';
import 'package:pcnc_task/global/widgets/drawer_icon.dart';
import 'package:pcnc_task/global/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
          future: getProfile(), // Fetch data when FutureBuilder is created
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the data is being fetched
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If an error occurs
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // If data is successfully fetched
              final data = snapshot.data!;
              return Selector<UserProvider, AppUser>(
                  selector: (_, provider) =>
                      provider.user, // will rebuild only when `bar` changes
                  builder: (_, user, __) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [Text('User name  : ${user.name} ')],
                      ),
                    );
                  });
            } else {
              // If no data is available
              return Center(child: Text('No data available'));
            }
          },
        ));
  }
}
