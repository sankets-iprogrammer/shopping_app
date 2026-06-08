import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopping_app/core/network_project/api_base_url.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/network_project/api_end_points.dart';
import 'package:shopping_app/core/network_project/interceptor/apiRequestModel.dart';
import 'package:shopping_app/core/services/storage_services/token_storage.dart';

class AuthInterceptor extends Interceptor {
  static String accessToken = "";
  static bool isRefreshing =false;
  static List<String> authIndependentPaths = [
    ApiEndPoints.login,
    ApiEndPoints.authRefresh,
    ApiBaseUrl.baseUrl + ApiEndPoints.authRefresh
  ];
  static TokenStorage tokenStorage = TokenStorage();
  static List<ApiRequestModel> requestQueue=[];


  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    if (options.path.contains(ApiEndPoints.authRefresh)) {
      if(!isRefreshing){
        isRefreshing=true;
        Map<String, dynamic> data = {
          'refreshToken': await tokenStorage.refreshToken() ?? "",
          'expiresInMins': 30,
        };
        options.data = data;
        super.onRequest(options, handler);
      }
    } else if (!authIndependentPaths.contains(options.path)) {
      // String? accessToken =await tokenStorage.getAccessToken();
      if(isRefreshing){
        requestQueue.add(ApiRequestModel(handler: handler, options: options));
      }else{
        options.headers.addAll({'Authorization': 'Bearer $accessToken'});
        super.onRequest(options, handler);
      }
    }else{
      super.onRequest(options, handler);
    }
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async{
    if (err.requestOptions.path.contains(ApiEndPoints.authRefresh)) {
      isRefreshing=false;
      accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3ODA2NTE5NDksImV4cCI6MTc4MDY1NTU0OX0.7v0FNoi2y89e5rG7ThGeddqKWhnT3_jJ4tVW2ic8QvM";
      log("queue have ${requestQueue.length} requests");
      for(ApiRequestModel request in requestQueue){
        request.options.headers.addAll({'Authorization': 'Bearer $accessToken'});
        request.handler.next(request.options);
        log("calling api from queue");
      }
      requestQueue.clear();
      super.onError(err, handler);
    }else if (err.type == DioExceptionType.badResponse && !authIndependentPaths.contains(err.requestOptions.path)) {
      if(!isRefreshing){
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

}
