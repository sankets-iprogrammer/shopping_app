import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app/core/network_project/api_base_url.dart';
import 'package:shopping_app/core/network_project/interceptor/logger_interceptor.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/error_interceptor.dart';

class ApiClient {
  late final Dio dio;
  ApiClient(){
    dio=Dio(
      BaseOptions(
        baseUrl: ApiBaseUrl.baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {"content-type": "application/json"}
      )
    );

    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(ErrorInterceptor());
    if(kDebugMode){
      dio.interceptors.add(LoggerInterceptor());
    }
  }
}