import 'package:shopping_app/core/services/storage_services/token_storage.dart';
import 'package:shopping_app/features/authentication/data/auth_api.dart';
import 'package:shopping_app/features/authentication/model/login_request.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';

class AuthRepository {
  final AuthApi api;
  final TokenStorage storage;
  AuthRepository({
    required this.api,
    required this.storage
});
  Future<void> login(LoginRequest request)async{
    final LoginResponse response =await api.login(request);
    await storage.saveTokens(accessToken: response.accessToken, refreshToken: response.refreshToken);
  }
}