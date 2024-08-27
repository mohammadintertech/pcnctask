import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/models/user.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:pcnc_task/services/end_points.dart';
import 'package:pcnc_task/services/requester.dart';

class UserProvider with ChangeNotifier {
  AppUser? _user;

  AppUser get user => _user!;

  Future<bool> login(String email, String password) async {
    try {
      final response = await Requester().postRequest(
        EndPoints.login(),
        data: {
          'email': email,
          'password': password,
        },
      );
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = json.decode(response.body);
        final access_token = data['access_token'];
        final refresh_token = data['refresh_token'];

        TokenManager().saveAccessToken(access_token);
        TokenManager().saveRefreshToken(refresh_token);
        print('Login Successfully : ${data.toString()}');
        getProfile();
        return true;
      } else {
        print('Login failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String name) async {
    try {
      final response = await Requester().postRequest(
        "https://api.escuelajs.co/api/v1/users/",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "avatar": "https://api.lorem.space/image/face?w=640&h=480"
        },
      );
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = json.decode(response.body);

        print('Sign Up Successfully : ${data.toString()}');
        AppToast.showToast('Sign Up Successfully');
        return true;
      } else {
        print('Sign failed: ${response.body}');
        AppToast.showToast('Sign Up failed');
        return false;
      }
    } catch (e) {
      print('Sign error: $e');
      AppToast.showToast("$e");
      return false;
    }
  }

  Future<void> getProfile() async {
    try {
      final response = await Requester().getRequest(
        EndPoints.profile(),
      );
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = json.decode(response.body);
        _user = AppUser.fromJson(data);
        print(_user!.toJson());
      } else {
        print('Request failed: ${response.body}');
        AppToast.showToast(
            'Failed request with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Login error: $e');
      AppToast.showToast('$e');
    }
  }
}
