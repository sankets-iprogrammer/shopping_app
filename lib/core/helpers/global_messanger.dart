import 'dart:async';

import 'package:flutter/material.dart';

class GlobalMessenger {
  static GlobalKey<ScaffoldMessengerState> globalMessengerKey =GlobalKey<ScaffoldMessengerState>();
  static Future<bool> getConfirmationSnackBar(String message,String optionLabel){
    Completer<bool> completer =Completer<bool>();
    globalMessengerKey.currentState?.hideCurrentSnackBar();
    globalMessengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: Duration(days: 1),
          content: Row(
        children: [
          Icon(Icons.error),
          Text(message),
          InkWell(
            onTap: (){
              globalMessengerKey.currentState?.hideCurrentSnackBar();
                completer.complete(true);
            },
            child: Text(optionLabel),
          ),
        ],
      ) )
    );
    return completer.future;
  }
}