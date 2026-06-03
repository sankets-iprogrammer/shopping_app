import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showErrorSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }
}