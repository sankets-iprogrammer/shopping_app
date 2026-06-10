import 'package:flutter/material.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import 'package:shopping_app/core/services/storage_services/shared_preferences_service.dart';
import '../../features/authentication/screens/login_screen.dart';
import 'global_navigator.dart';

class CommonFunctions {
  static void logout(){
    SecureStorage.clear();
    SharedPreferencesServices.setLoggedIn(false);
    GlobalNavigator.navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),(_) => false,
    );
  }
}