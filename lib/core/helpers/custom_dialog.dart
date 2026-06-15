import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';

class CustomDialog {
  static Future<bool> showConfirmationDialog (
      BuildContext context, {
    required String message,
     bool cancelEnabled=false,
  }
      ) async{
    bool answer=false;
   await showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message,style: LightTheme.sectionTitle.copyWith(fontSize: 20),textAlign: TextAlign.center,),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: MyButton.secondaryButton(text: "Cancel", onTap: (){
                    Navigator.of(context).pop();
                  },verticalPadding: 8)),
                  Expanded(child: MyButton.primaryButton(text: "Delete", onTap: (){
                    answer=true;
                    Navigator.of(context).pop();
                  },verticalPadding: 8)),
                ],
              )
            ],
          ),
        );
    });
   return answer;
  }
}