import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage storage =const FlutterSecureStorage();
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken
}) async{
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  Future<String?> getAccessToken()async{
    return await storage.read(key: "accessToken");
  }

  Future<String?> refreshToken()async{
    return await storage.read(key: "refreshToken");
  }

  Future<void> clear()async{
    await storage.deleteAll();
  }
}