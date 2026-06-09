import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopping_app/core/network_project/api_base_url.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/network_project/api_end_points.dart';
import 'package:shopping_app/core/network_project/interceptor/apiRequestModel.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';

class AuthInterceptor extends Interceptor {
  static bool isRefreshing = false;
  static List<String> authIndependentPaths = [
    ApiEndPoints.login,
    ApiEndPoints.authRefresh,
    ApiBaseUrl.baseUrl + ApiEndPoints.authRefresh,
  ];
  static List<ApiRequestModel> requestQueue = [];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.contains(ApiEndPoints.authRefresh)) {
      if (!isRefreshing) {
        isRefreshing = true;
        Map<String, dynamic> data = {
          'refreshToken': await SecureStorage.refreshToken() ?? "",
          'expiresInMins': 30,
        };
        options.data = data;
        super.onRequest(options, handler);
      }
    } else if (!authIndependentPaths.contains(options.path)) {
      String? accessToken = await SecureStorage.getAccessToken();
      if (isRefreshing) {
        requestQueue.add(ApiRequestModel(handler: handler, options: options));
      } else {
        options.headers.addAll({'Authorization': 'Bearer $accessToken j'});
        super.onRequest(options, handler);
      }
    } else {
      super.onRequest(options, handler);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.requestOptions.path.contains(ApiEndPoints.authRefresh)) {
      isRefreshing = false;
      requestQueue.clear();
      log("need to login");
      super.onError(err, handler);
    } else if (err.type == DioExceptionType.badResponse &&
        !authIndependentPaths.contains(err.requestOptions.path)) {
      if (!isRefreshing) {
        log("need to call refresh token");
        ApiCalls.refreshAccessToken();
        log("refresh api called");
      }
      handler.resolve(await ApiCalls.retryApiCall(err.requestOptions));
      log("retry_api_call_after_error");
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.path.contains(ApiEndPoints.authRefresh)) {
      isRefreshing = false;
      final data = response.data;
      String? accessToken = data['accessToken'];
      String? refreshToken = data['refreshToken'];
      if (accessToken != null && refreshToken != null) {
        SecureStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
        log("queue have ${requestQueue.length} requests");
        for (ApiRequestModel request in requestQueue) {
          request.options.headers.addAll({
            'Authorization': 'Bearer $accessToken',
          });
          request.handler.next(request.options);
          log("calling api from queue");
        }
        requestQueue.clear();
      } else {
        log("need to login");
      }
      requestQueue.clear();
    }
    super.onResponse(response, handler);
  }
}
