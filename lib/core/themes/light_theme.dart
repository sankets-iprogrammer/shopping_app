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
  static Color errorTextColor= Color(0xfff9848c);
  static Color starColor= Color(0xFFFFD700);
  static Color specBorderColor=Color(0xFFC3C6D5);
  static Color impSnackBarBackgroundColor=Color(0xFF040C2B);
  static Color impSnackBarOnBackgroundColor=Colors.white;


  static double pageHorizontalMargin =25;
  static double pageVerticalMargin =25;


  static TextStyle cartPriceText =textStyle.copyWith(
      fontSize:14,
      fontWeight: FontWeight(500),
      color:primaryOnBackgroundColor
  );
  static TextStyle cartTotalPriceText =textStyle.copyWith(
      fontSize:15,
      fontWeight: FontWeight(900),
      color:primaryOnBackgroundColor
  );


  static TextStyle impSnackBarText =textStyle.copyWith(
      fontSize:16,
      fontWeight: FontWeight(700),
      color:impSnackBarOnBackgroundColor
  );

  static TextStyle pageTitle =GoogleFonts.nunito(
    fontSize:24,
    fontWeight: FontWeight(700),
    color: primaryOnBackgroundColor
  );

  static TextStyle profileLabelText =pageDesc.copyWith(fontSize: 15,fontWeight:FontWeight(600));
  static TextStyle profileValueText =pageDesc.copyWith(color: primaryOnBackgroundColor, fontSize: 15);


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
  static TextStyle cardCurrentPriceStyle =productBasePriceStyle.copyWith(fontSize: 13);
  static TextStyle productBasePriceStyle =cardCompanyNameStyle.copyWith(fontSize: 20,decoration: TextDecoration.lineThrough, decorationColor:descTextColor,decorationThickness: 2);
  static TextStyle productCurrentPriceStyle =cardPriceStyle.copyWith(fontSize: 24);
  static TextStyle productNameStyle =GoogleFonts.nunito(
    fontSize:20,
    fontWeight: FontWeight(700),
    color: primaryOnBackgroundColor,
  );
  static TextStyle productStockStyle =GoogleFonts.nunito(
    fontSize:15,
    fontWeight: FontWeight(300),
    color: primaryOnBackgroundColor,
  );
  static TextStyle productSectionTitle =sectionTitle.copyWith(fontSize: 19);
  static TextStyle productDesc =productStockStyle.copyWith(fontWeight:FontWeight(400));




  static InputBorder textFieldBorder =OutlineInputBorder(borderSide: BorderSide(width: 1,color: descTextColor),borderRadius: BorderRadius.circular(10  ));
  static InputDecoration textFieldDecoration({required String label, required String hintText,required IconData iconData,IconData? suffixIcon,Function? onSuffixIconClicked}){
    return InputDecoration(
      counterText: "",
        label: Text(label),
        suffixIcon: suffixIcon==null?null:InkWell(
            child: Icon(suffixIcon,size: 25,color: descTextColor,),
          onTap:(){
              if(onSuffixIconClicked==null) return;
              onSuffixIconClicked();
          }
        ),
        prefixIcon: Icon(iconData,size: 25,color: descTextColor,),
        contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        hintText: hintText,
        hintStyle: textFieldHint,
        enabledBorder:textFieldBorder,
        focusedBorder: textFieldBorder.copyWith(borderSide:  BorderSide(width: 2,color: secondaryBackgroundColor)),
        border:textFieldBorder,

    );
  }

}