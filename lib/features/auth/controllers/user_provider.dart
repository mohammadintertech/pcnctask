import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/models/user.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:pcnc_task/services/end_points.dart';
import 'package:pcnc_task/services/requester.dart';

class UserProvider with ChangeNotifier {
  TokenManager tokenManager = TokenManager();
  AppUser? _user;

  get user {
    return _user ?? false;
  }

  Future<bool> logout() async {
    await tokenManager.removeTokens();
    _user = null;
    return true;
  }

  Future<bool> isUserLoggedIn() async {
    final token = await tokenManager.getAccessToken();

    return token != "";
  }

  Future<void> login(String email, String password, context) async {
    try {
      final response = await Requester.postRequest(
        EndPoints.login(),
        data: {
          'email': email,
          'password': password,
        },
      );
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        final access_token = data['access_token'];
        final refresh_token = data['refresh_token'];

        tokenManager.saveAccessToken(access_token);
        tokenManager.saveRefreshToken(refresh_token);
        AppToast.showToast('Login Successfully');
        print('Login Successfully : ${data.toString()}');

        getProfile();

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/nav_screen',
          (Route<dynamic> route) => false,
        );
        return;
      } else {
        print('Login failed: ${response.data}');
        AppToast.showToast('Login failed ${response.data}');
        return;
      }
    } catch (e) {
      print('Login error: $e');
      AppToast.showToast('$e');
      return;
    }
  }

  Future<void> signUp(
      String email, String password, String name, context) async {
    try {
      final response = await Requester.postRequest(
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
        final data = response.data;

        print('Sign Up Successfully : ${data.toString()}');
        AppToast.showToast('Sign Up Successfully');
        await login(email, password, context);
        return;
      } else {
        print('Sign failed: ${response.data}');
        AppToast.showToast('Sign Up failed');
        return;
      }
    } catch (e) {
      print('Sign error: $e');
      AppToast.showToast("$e");
      return;
    }
  }

  Future<bool> getProfile() async {
    try {
      var response = await Requester.getRequest(
        EndPoints.profile(),
      );
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        _user = AppUser.fromJson(data);
        notifyListeners();
        return true;
      } else {
        print('Request failed: ${response.data}');
        AppToast.showToast(
            'Failed request with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      AppToast.showToast('$e');
      return false;
    }
  }
}
