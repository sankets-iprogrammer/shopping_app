import 'package:dio/dio.dart';

class ApiRequestModel{
  final RequestOptions options;
  final RequestInterceptorHandler handler;
  ApiRequestModel({
    required this.handler,
    required this.options
});
}