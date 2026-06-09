import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/network_project/api_exception.dart';

class ErrorInterceptor extends Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch(err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        log(err.type.toString());
        handler.next(err.copyWith(error: ApiException("Connection timeout")));
        break;
      case DioExceptionType.badResponse:
        // log(err.message.toString());
        handler.next(err.copyWith(error: ApiException("Bad Response")));
        break;
      case DioExceptionType.connectionError:
        log(err.type.toString());
        handler.next(err.copyWith(error: ApiException("connection error")));
        break;
      default:
        handler.next(err);
    }
  }
}