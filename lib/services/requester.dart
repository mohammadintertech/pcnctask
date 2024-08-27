import 'dart:convert';
import 'package:http/http.dart' as http;

class Requester {
  Future<http.Response> getRequest(
    String path,
  ) async {
    try {
      Uri uri = Uri.parse('$path');
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
      });
      _handleResponse(response);
      return response;
    } catch (e) {
      print('GET request error: $e');
      rethrow;
    }
  }

  Future<http.Response> postRequest(String path, {dynamic data}) async {
    try {
      Uri uri = Uri.parse('$path');
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
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
      throw Exception(
          'Failed request with status code: ${response.statusCode}');
    }
  }
}
