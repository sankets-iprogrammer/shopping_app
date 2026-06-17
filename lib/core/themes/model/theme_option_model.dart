import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/app_theme.dart';

class ThemeOptionModel {
  String id;
  IconData iconData;
  String title;
  AppTheme theme;
  ThemeOptionModel({
    required this.id,
    required this.iconData,
    required this.title,
    required this.theme
});
}