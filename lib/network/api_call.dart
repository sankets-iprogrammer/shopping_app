import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopping_app/features/authentication/model/login_request.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
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
    }catch(e){
      throw ApiException("Unknown Error");
    }

  }
  static Future<List<ProductModel>> getAllProductsList({ required int skip})async{
    try{
      final response=await dio.get(
          ApiBaseUrl.baseUrl+ApiEndPoints.getProductsList,
          queryParameters: {
            'limit':10,
            'skip':skip,
            'select': ',id,title,price,brand,images,discountPercentage'
          }
      );
      log(response.data["products"].toString());
       return (response.data["products"] as List).map((product){
         log(product.toString());
         return ProductModel.fromJson(product as Map<String,dynamic>);
       }).toList();

    }on DioException catch (e){
      switch (e.response?.statusCode) {
        case 400:
          log('Bad Request');
          throw ApiException("Bad Request");
        case 401:
          log('Invalid Credentials');
          throw ApiException("Invalid Credentials");
        case 500:
          log('Server Error');
          throw ApiException("Server Error");
        default:
          throw ApiException("Unknown Error");
      }
    }catch(e){
      throw ApiException("Unknown Error");
    }
  }

  static Future<List<String>> getCategoryList()async{
    try{
      final response=await dio.get(
        ApiBaseUrl.baseUrl+ApiEndPoints.getCategoryList
      );
      log(response.data.toString());
      return (response.data as List<dynamic>).map((category){return category as String;}).toList();
    }on DioException catch (e){
      switch (e.response?.statusCode) {
        case 400:
          log('Bad Request');
          throw ApiException("Bad Request");
        case 401:
          log('Invalid Credentials');
          throw ApiException("Invalid Credentials");
        case 500:
          log('Server Error');
          throw ApiException("Server Error");
        default:
          throw ApiException("Unknown Error");
      }
    }catch(e){
      throw ApiException("Unknown Error");
    }
  }
}