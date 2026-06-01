
import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
AppBar myAppBar (){
return AppBar(
  backgroundColor: LightTheme.secondaryBackgroundColor,
title: Text("Shop Smart",style: LightTheme.pageTitle.copyWith(color: LightTheme.secondaryOnBackgroundColor),),
);
}




