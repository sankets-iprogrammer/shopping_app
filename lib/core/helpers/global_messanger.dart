import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';

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
          Icon(Icons.error,color: LightTheme.errorTextColor,size: 25,),
          SizedBox(width: 5,),
          Expanded(child: Text(message,overflow: TextOverflow.ellipsis,style:
              LightTheme.impSnackBarText
            )),
          InkWell(
            onTap: (){
              globalMessengerKey.currentState?.hideCurrentSnackBar();
                completer.complete(true);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: LightTheme.impSnackBarOnBackgroundColor),
                borderRadius: BorderRadius.circular(10)
              ),
                child: Text(optionLabel,style: LightTheme.impSnackBarText.copyWith(fontSize: 14),)),
          ),
        ],
      ) )
    );
    return completer.future;
  }
}