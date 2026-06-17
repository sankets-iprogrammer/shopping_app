import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/app_theme.dart';


class CustomAppbar{
  static Widget featureAppbar(String  title,{bool goBack =false,required BuildContext context,required AppTheme theme}){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 80, bottom: 30, left: 20),
      decoration: BoxDecoration(
        color: theme.secondaryBackgroundColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(200, 20),
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          goBack?
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
              child: Icon(Icons.arrow_back,color: theme.secondaryOnBackgroundColor,)):
          SizedBox(),
          Text(
            title,
            style: theme.pageTitle.copyWith(
              color: theme.secondaryOnBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}