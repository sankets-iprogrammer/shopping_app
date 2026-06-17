import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/app_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';

import '../themes/theme_bloc/theme_bloc.dart';

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
          backgroundColor: context.read<ThemeBloc>().state.currentTheme.primaryBackgroundColor,
          content: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message,style:context.read<ThemeBloc>().state.currentTheme.sectionTitle.copyWith(fontSize: 20),textAlign: TextAlign.center,),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: MyButton.secondaryButton(text: "Cancel", onTap: (){
                    Navigator.of(context).pop();
                  },verticalPadding: 7,theme: context.read<ThemeBloc>().state.currentTheme)),
                  Expanded(child: MyButton.primaryButton(text: "Ok", onTap: (){
                    answer=true;
                    Navigator.of(context).pop();
                  },verticalPadding: 8,theme: context.read<ThemeBloc>().state.currentTheme)),
                ],
              )
            ],
          ),
        );
    });
   return answer;
  }
}
