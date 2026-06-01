import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LightTheme {
  static TextStyle textStyle= GoogleFonts.nunito();

  static Color primaryBackgroundColor= Color(0xFFffffff);
  static Color secondaryBackgroundColor =Color(0xFF0857a0);
  static Color primaryCardBackgroundColor =Color(0xFFe7eff6);
  static Color secondaryCardBackgroundColor =Color(0xFFf3f3f3);
  static Color disabledBackgroundColor =Color(0xFFececec);
  static Color discountCardBackgroundColor =Color(0xFFfddf82);


  static Color primaryOnBackgroundColor= Color(0xFF000000);
  static Color descTextColor=Color(0xFF939393);
  static Color secondaryOnBackgroundColor =Color(0xFFffffff);
  static Color primaryCardOnBackgroundColor =Color(0xFF000000);
  static Color primaryCardOnBackgroundSecondaryColor =Color(0xFF000000);
  static Color secondaryCardOnBackgroundColor =Color(0xFF939393);
  static Color disabledOnBackgroundColor =Color(0xFF939393);
  static Color discountCardOnBackgroundColor =Color(0xFF000000);
  static Color navigationTextColor= Color(0xFF0857a0);


  static double pageHorizontalMargin =35;
  static double pageVerticalMargin =25;

  static TextStyle pageTitle =GoogleFonts.nunito(
    fontSize:24,
    fontWeight: FontWeight(700),
    color: primaryOnBackgroundColor
  );

  static TextStyle sectionTitle =GoogleFonts.nunito(
      fontSize:16,
      fontWeight: FontWeight(700),
      color: primaryOnBackgroundColor
  );

  static TextStyle pageDesc =textStyle.copyWith(
    fontSize:14,
    fontWeight: FontWeight(400),
    color:descTextColor
  );

  static TextStyle navigationTextStyle =textStyle.copyWith(
      fontSize:13,
      fontWeight: FontWeight(400),
      color:navigationTextColor
  );

  static TextStyle textFieldHint =textStyle.copyWith(
      fontSize:14,
      fontWeight: FontWeight(500),
      color:primaryOnBackgroundColor
  );

  static TextStyle categoryCardTitleStyle =textStyle.copyWith(
      fontSize:13,
      fontWeight: FontWeight(600),
      color:secondaryOnBackgroundColor
  );

  static TextStyle cardProductNameStyle =GoogleFonts.nunito(
      fontSize:13,
      fontWeight: FontWeight(700),
      color: primaryCardOnBackgroundColor,
  );

  static TextStyle cardCompanyNameStyle =GoogleFonts.nunito(
    fontSize:13,
    fontWeight: FontWeight(700),
    color: descTextColor,
  );

  static TextStyle cardPriceStyle =GoogleFonts.nunito(
    fontSize:15,
    fontWeight: FontWeight(700),
    color: primaryCardOnBackgroundColor,
  );
  static TextStyle cardDiscountStyle =GoogleFonts.nunito(
    fontSize:10,
    fontWeight: FontWeight(400),
    color: discountCardOnBackgroundColor,
  );


  static InputBorder textFieldBorder =OutlineInputBorder(borderSide: BorderSide(width: 1,color: descTextColor),borderRadius: BorderRadius.circular(10  ));
  static InputDecoration textFieldDecoration({required String label, required String hintText,required IconData iconData,IconData? suffixIcon,Function? onSuffixIconClicked}){
    return InputDecoration(
        label: Text(label),
        suffixIcon: suffixIcon==null?null:InkWell(
            child: Icon(suffixIcon,size: 25,color: descTextColor,),
          onTap:(){
              if(onSuffixIconClicked==null) return;
              onSuffixIconClicked();
          }
        ),
        prefixIcon: Icon(iconData,size: 25,color: descTextColor,),
        contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 12),
        hintText: hintText,
        hintStyle: textFieldHint,
        enabledBorder:textFieldBorder,
        focusedBorder: textFieldBorder.copyWith(borderSide:  BorderSide(width: 2,color: secondaryBackgroundColor)),
        border:textFieldBorder,

    );
  }

}