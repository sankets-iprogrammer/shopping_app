import 'dart:async';

import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

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
          Icon(Icons.error,color: Colors.red,size: 25,),
          SizedBox(width: 5,),
          Expanded(child: Text(message,overflow: TextOverflow.ellipsis,style:
         TextStyle(
           color: Colors.white,
           fontSize:16,
           fontWeight: FontWeight(700),
         )
            )),
          InkWell(
            onTap: (){
              globalMessengerKey.currentState?.hideCurrentSnackBar();
                completer.complete(true);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
                child: Text(optionLabel,style: TextStyle(
                  color: Colors.white,
                  fontSize:16,
                  fontWeight: FontWeight(700),
                ).copyWith(fontSize: 14),)),
          ),
        ],
      ) )
    );
    return completer.future;
  }
}