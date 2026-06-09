import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shopping_app/core/network_project/api_exception.dart';

class LoggerInterceptor extends Interceptor{
  Logger logger =Logger();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("""------request-------
    path: ${options.path}
    data: ${options.data}
    headers: ${options.headers}""");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    logger.i("""------response-------
    status code: ${response.statusCode}
    data: ${response.data}""");
    super.onResponse(response, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e("""-----Api Error------
    api path: ${err.requestOptions.path}
    error type: ${err.type}
    response data ${err.response?.data}
    error status code : ${err.response?.statusCode}
    error message: ${err.error is ApiException? (err.error as ApiException).message: err.message}
    """);
    super.onError(err, handler);
  }
}