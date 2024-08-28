import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/controllers/user_provider.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:pcnc_task/services/end_points.dart';

class Requester {
  static Dio dio = Dio();
  Requester() {
    print('Requester Start');
  }

  static void setupDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await TokenManager().getAccessToken();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
            options.headers['Content-Type'] = 'application/json';
            options.headers['Accept'] = '*/*';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          // Check if the error is a 401 Unauthorized
          if (error.response?.statusCode == 401) {
            AppToast.showToast("Unauthorized .. Refresh Token..");

            TokenManager tokenManager = TokenManager();
            final refreshToken = await tokenManager.getRefreshToken();
            if (refreshToken != null) {
              try {
                final refreshResponse = await dio.post(
                  EndPoints.refreshToken(),
                  data: {'refreshToken': refreshToken},
                );

                print(refreshResponse);

                if (refreshResponse.statusCode == 201) {
                  // Store the new tokens
                  final newAccessToken = refreshResponse.data['access_token'];
                  final newRefreshToken = refreshResponse.data['refresh_token'];

                  await tokenManager.saveAccessToken(newAccessToken);
                  await tokenManager.saveRefreshToken(newRefreshToken);

                  final retryOptions = error.requestOptions;
                  retryOptions.headers['Authorization'] =
                      'Bearer $newAccessToken';

                  final retryResponse = await dio.request(
                    retryOptions.path,
                    options: Options(
                      method: retryOptions.method,
                      headers: retryOptions.headers,
                    ),
                    data: retryOptions.data,
                    queryParameters: retryOptions.queryParameters,
                  );

                  return handler.resolve(retryResponse);
                } else {
                  AppToast.showToast(error);
                  return handler.reject(error);
                }
              } catch (e) {
                print(e.toString());
                AppToast.showToast(e.toString());
                return;
              }
            } else {
              AppToast.showToast(error.toString());
              return handler.reject(error);
            }
          } else {
            return handler.next(error);
          }
        },
      ),
    );
  }

  static Future<Response<dynamic>> getRequest(
    String path,
  ) async {
    try {
      print(path);

      final response = await dio.get(
        path,
      );

      print(response);
      return response;
    } catch (e) {
      print('GET request error: $e');
      rethrow;
    }
  }

  static Future<Response<dynamic>> postRequest(String path,
      {dynamic data}) async {
    try {
      Uri uri = Uri.parse(path);
      print(uri);

      print(data);

      final response = await dio.post(
        path,
        data: data,
      );

      return response;
    } catch (e) {
      print('POST request error: $e');
      rethrow;
    }
  }
}
