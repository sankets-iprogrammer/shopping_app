import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopping_app/features/authentication/model/login_request.dart';
import 'package:shopping_app/network/api_base_url.dart';
import 'package:shopping_app/network/api_end_points.dart';
import 'package:shopping_app/network/api_exception.dart';


class ApiCall {
  static final dio=Dio();
  static Future login(LoginRequest loginRequest) async{
    try{
      final response =await dio.post(
          ApiBaseUrl.baseUrl+ApiEndPoints.login,
        data: loginRequest.toJson()
        ,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      log(response.data.toString());
    }on DioException catch (e){
      // e.response?.statusCode;
      switch (e.response?.statusCode) {
        case 400:
          log('Bad Request');
          throw ApiException("Bad Request-Invalid Credentials");
        case 401:
          log('Invalid Credentials');
          throw ApiException("Invalid Credentials");
        case 500:
          log('Server Error');
          throw ApiException("Server Error");
        default:
          throw ApiException("Unknown Error");

      }
    }

  }
}