import 'package:dio/dio.dart';
import 'package:shopping_app/core/network_project/api_base_url.dart';
import 'package:shopping_app/core/network_project/api_client.dart';
import 'package:shopping_app/core/network_project/api_end_points.dart';

class ApiCalls{
  static ApiClient apiClient=ApiClient();

  static Future<dynamic> getCurrentUser()async{
    Response response= await apiClient.dio.get(
        ApiBaseUrl.baseUrl+ApiEndPoints.getCurrentUser,
    );
    return response.data;
  }

  static Future<void> refreshAccessToken()async{
    await apiClient.dio.post(
      ApiBaseUrl.baseUrl+ApiEndPoints.authRefresh
    );
  }

  static Future<Response> retryApiCall(RequestOptions requestOptions)async{
    Response response =await apiClient.dio.fetch(requestOptions);
    return response;
  }
}