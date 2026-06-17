import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

class LightTheme extends AppTheme{
  @override
  TextStyle get textStyle=>GoogleFonts.nunito();
  @override
  Color get primaryBackgroundColor =>Color(0xFFffffff);
  @override
  Color get secondaryBackgroundColor =>Color(0xFF0857a0);
  @override
  Color get primaryCardBackgroundColor =>Color(0xFFe7eff6);
  @override
  Color get disabledBackgroundColor=>Color(0xFFececec);
  @override
  Color get discountCardBackgroundColor=>Color(0xFFfddf82);
  @override
  Color get primaryOnBackgroundColor=>Color(0xFF000000);
  @override
  Color get descTextColor=>Color(0xFF939393);
  @override
  Color get secondaryOnBackgroundColor =>Color(0xFFffffff);
  @override
  Color get primaryCardOnBackgroundColor =>Color(0xFF000000);
  @override
  Color get primaryCardOnBackgroundSecondaryColor=>Color(0xFF000000);
  @override
  Color get disabledOnBackgroundColor=>Color(0xFF939393);
  @override
  Color get discountCardOnBackgroundColor=>Color(0xFF000000);
  @override
  Color get navigationTextColor=>Color(0xFF0857a0);
  @override
  Color get errorTextColor=>Color(0xfff9848c);
  @override
  Color get starColor=>Color(0xFFFFD700);
  @override
  Color get specBorderColor=>Color(0xFFC3C6D5);
  @override
  Color get impSnackBarBackgroundColor=>Color(0xFF040C2B);
  @override
  Color get impSnackBarOnBackgroundColor=>Colors.white;
  @override
  double get pageHorizontalMargin=>25;
  @override
  double get pageVerticalMargin=>25;
}