import 'package:dio/dio.dart';
import 'package:shopping_app/core/network_project/api_base_url.dart';
import 'package:shopping_app/core/network_project/api_client.dart';
import 'package:shopping_app/core/network_project/api_end_points.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';
import '../../features/authentication/model/login_request.dart';
import '../../features/home_page/model/product_model.dart';

class ApiCalls {
  static ApiClient apiClient = ApiClient();

  static Future login(LoginRequest loginRequest) async {
    Map<String,dynamic> data =loginRequest.toJson();
    data["expiresInMins"]=5;
    final response = await apiClient.dio.post(
      ApiBaseUrl.baseUrl + ApiEndPoints.login,
      data: data,
    );
    final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
    return loginResponse;
  }

  static Future<dynamic> getCurrentUser() async {
    Response response = await apiClient.dio.get(
      ApiBaseUrl.baseUrl + ApiEndPoints.getCurrentUser,
    );
    return response.data;
  }

  static Future<void> refreshAccessToken() async {
    await apiClient.dio.post(ApiBaseUrl.baseUrl + ApiEndPoints.authRefresh);
  }

  static Future<Response> retryApiCall(RequestOptions requestOptions) async {
    Response response = await apiClient.dio.fetch(requestOptions);
    return response;
  }

  static Future<List<ProductModel>> getAllProductsList({
    required int skip,
  }) async {
    final response = await apiClient.dio.get(
      ApiBaseUrl.baseUrl + ApiEndPoints.getProductsList,
      queryParameters: {
        'limit': 10,
        'skip': skip,
        'select': ',id,title,price,brand,images,discountPercentage',
      },
    );
    return (response.data["products"] as List).map((product) {
      return ProductModel.fromJson(product as Map<String, dynamic>);
    }).toList();
  }

  static Future<List<String>> getCategoryList() async {
    final response = await apiClient.dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.getCategoryList
    );
    return (response.data as List<dynamic>).map((category) {
      return category as String;
    }).toList();
  }

  static Future<ProductModel> getProductData(int id) async {
    final response = await apiClient.dio.get(
      "${ApiBaseUrl.baseUrl}${ApiEndPoints.getProductsData}/$id",
    );
    return ProductModel.fromJson(response.data as Map<String, dynamic>);
  }

}
