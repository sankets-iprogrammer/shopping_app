import 'package:flutter/material.dart';

import '../themes/light_theme.dart';

class CustomAppbar{
  static Widget featureAppbar(String  title,{bool goBack =false,required BuildContext context}){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 80, bottom: 30, left: 20),
      decoration: BoxDecoration(
        color: LightTheme.secondaryBackgroundColor,
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
              child: Icon(Icons.arrow_back,color: LightTheme.secondaryOnBackgroundColor,)):
          SizedBox(),
          Text(
            title,
            style: LightTheme.pageTitle.copyWith(
              color: LightTheme.secondaryOnBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}