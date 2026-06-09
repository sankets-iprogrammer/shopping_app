
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';

import '../../../features/main_screen/model/user_data_model.dart';

class SecureStorage {
 static final FlutterSecureStorage storage =const FlutterSecureStorage();
 static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken
}) async{
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);
  }

 static Future<String?> getAccessToken()async{
    return await storage.read(key: "accessToken");
  }

 static Future<String?> refreshToken()async{
    return await storage.read(key: "refreshToken");
  }

 static Future<void> addUserLoginData(LoginResponse loginResponse)async{
    await saveTokens(accessToken: loginResponse.accessToken, refreshToken: loginResponse.refreshToken);
    await storage.write(key: "id", value: loginResponse.id.toString());
    await storage.write(key: "email", value: loginResponse.email);
    await storage.write(key: "firstName", value: loginResponse.firstName);
    await storage.write(key: "lastName", value: loginResponse.lastName);
    await storage.write(key: "gender", value: loginResponse.gender);
    await storage.write(key: "image", value: loginResponse.image);
    await storage.write(key: "username", value: loginResponse.username);
  }

 static Future<UserDataModel> getUserData()async{
    int id = int.parse(await storage.read(key: "id")??"0");
    String? email = await storage.read(key: "email");
    String? firstName = await storage.read(key: "firstName");
    String? lastName = await storage.read(key: "lastName");
    String? gender = await storage.read(key: "gender");
    String? image = await storage.read(key: "image");
    String username = await storage.read(key: "username")??"";
    return UserDataModel(id: id, username: username, email: email,firstName: firstName,lastName: lastName,gender: gender,image: image);
  }

 static Future<void> clear()async{
    await storage.deleteAll();
  }
}