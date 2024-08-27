import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  final _storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  // Save access token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // Save refresh token
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // Get access token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  // Get refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // Remove tokens (e.g., on logout)
  Future<void> removeTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<void> refreshAccessToken() async {
    String? refreshToken = await getRefreshToken();
    // final response = await http.post(
    //   Uri.parse('$baseUrl/token/refresh'),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: json.encode({'refresh_token': refreshToken}),
    // );
    // if (response.statusCode == 200) {
    //   final newAccessToken = json.decode(response.body)['access_token'];
    //   await tokenManager.saveAccessToken(newAccessToken);
    // } else {
    //   // Handle token refresh failure
    // }
  }
}
