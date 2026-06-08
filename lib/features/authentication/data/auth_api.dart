import 'package:dio/dio.dart';
import 'package:shopping_app/core/network_project/api_end_points.dart';
import 'package:shopping_app/features/authentication/model/login_request.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';

class AuthApi {
  final Dio dio;
  AuthApi(this.dio);
  Future<LoginResponse> login (LoginRequest request)async{
    final response =await dio.post(
      ApiEndPoints.login,
      data: request.toJson()
    );
    return LoginResponse.fromJson(response.data);
  }
}