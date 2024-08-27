import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/global/widgets/toast.dart';

class Requester {
  Future<http.Response> getRequest(
    String path,
  ) async {
    try {
      print(path);
      Uri uri = Uri.parse('$path');
      Map<String, String> headers = {
        "Authorization":
            'Bearer ${await TokenManager().getAccessToken() ?? ""}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      final response = await http.get(uri, headers: headers);
      _handleResponse(response);
      return response;
    } catch (e) {
      print('GET request error: $e');
      rethrow;
    }
  }

  Future<http.Response> postRequest(String path, {dynamic data}) async {
    try {
      Uri uri = Uri.parse(path);
      print(uri);
      Map<String, String> headers = {
        "Authorization":
            'Bearer ${await TokenManager().getAccessToken() ?? ""}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      print(data);
      final response = await http.post(
        uri,
        headers: headers,
        body: json.encode(data),
      );
      _handleResponse(response);
      return response;
    } catch (e) {
      print('POST request error: $e');
      rethrow;
    }
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      AppToast.showToast(
          'Failed request with status code: ${response.statusCode}');
      throw Exception(
          'Failed request with status code: ${response.statusCode}');
    }
  }
}
