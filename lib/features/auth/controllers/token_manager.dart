import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  final _storage = const FlutterSecureStorage();
  static bool isLoggedIn = false;
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  // Save access token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
    print('saved');
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

  Future<bool> isTokenSaved() async {
    final token = await TokenManager().getAccessToken();

    return token != "";
  }
}
