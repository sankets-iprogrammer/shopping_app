import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/helpers/common_functions.dart';
import 'package:shopping_app/core/helpers/global_messanger.dart';
import 'package:shopping_app/core/network_project/api_base_url.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/network_project/api_end_points.dart';
import 'package:shopping_app/core/network_project/interceptor/apiRequestModel.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:shopping_app/features/main_screen/screens/main_screen.dart';

import '../../../features/authentication/screens/login_screen.dart';
import '../../../features/main_screen/bloc/main_screen_events.dart';
import '../../helpers/global_navigator.dart';

class AuthInterceptor extends Interceptor {
  static bool isRefreshing = false;
  static int refreshAttempts =0;
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
        isRefreshing = true;
        Map<String, dynamic> data = {
          'refreshToken': await SecureStorage.refreshToken()?? "",
          'expiresInMins': 30,
        };
        options.data = data;
        super.onRequest(options, handler);
    } else if (!authIndependentPaths.contains(options.path)) {
      String? accessToken = await SecureStorage.getAccessToken();
      if (isRefreshing) {
        requestQueue.add(ApiRequestModel(handler: handler, options: options));
      } else {
        options.headers.addAll({'Authorization': 'Bearer $accessToken'});
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
      log("need to login or retry");
      if(refreshAttempts<3){
        refreshAttempts++;
        if(await GlobalMessenger.getConfirmationSnackBar("Failed to refresh session.", "Retry")){
          ApiCalls.refreshAccessToken();
        }
      }else{
        isRefreshing = false;
        if(await GlobalMessenger.getConfirmationSnackBar("Your session has expired. Please log in again.","Login")){
          requestQueue.clear();
          refreshAttempts=0;
          CommonFunctions.logout();
        }
      }

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
        requestQueue.clear();
        refreshAttempts=0;
        CommonFunctions.logout();
      }
      requestQueue.clear();
    }
    super.onResponse(response, handler);
  }
}
