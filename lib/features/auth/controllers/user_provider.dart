import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/services/end_points.dart';
import 'package:pcnc_task/services/requester.dart';

class UserProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;
  Future<bool> login(String email, String password) async {
    try {
      final response = await Requester().postRequest(
        EndPoints.login(),
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final access_token = data['access_token'];
        final refresh_token = data['refresh_token'];

        TokenManager().saveAccessToken(access_token);
        TokenManager().saveRefreshToken(refresh_token);
        print('Login Successfully : ${data.toString()}');

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
}
