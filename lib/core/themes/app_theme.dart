import 'package:flutter/material.dart';
abstract class AppTheme {
  TextStyle get textStyle;
  Color get primaryBackgroundColor;
  Color get secondaryBackgroundColor;
  Color get primaryCardBackgroundColor;
  Color get disabledBackgroundColor;
  Color get discountCardBackgroundColor;
  Color get primaryOnBackgroundColor;
  Color get descTextColor;
  Color get secondaryOnBackgroundColor;
  Color get primaryCardOnBackgroundColor;
  Color get primaryCardOnBackgroundSecondaryColor;
  Color get disabledOnBackgroundColor;
  Color get discountCardOnBackgroundColor;
  Color get navigationTextColor;
  Color get errorTextColor;
  Color get starColor;
  Color get specBorderColor;
  Color get impSnackBarBackgroundColor;
  Color get impSnackBarOnBackgroundColor;
   double get pageHorizontalMargin;
   double get pageVerticalMargin;


  TextStyle get storeCategoryText =>textStyle.copyWith(
  fontSize: 17,
  fontWeight: FontWeight(500),
  color:primaryOnBackgroundColor.withAlpha(100)
  );

   TextStyle get cartPriceText =>textStyle.copyWith(
      fontSize:14,
      fontWeight: FontWeight(500),
      color:primaryOnBackgroundColor
  );
   TextStyle get cartTotalPriceText =>textStyle.copyWith(
      fontSize:15,
      fontWeight: FontWeight(900),
      color:primaryOnBackgroundColor
  );

   TextStyle get impSnackBarText =>textStyle.copyWith(
      fontSize:16,
      fontWeight: FontWeight(700),
      color:impSnackBarOnBackgroundColor
  );
   TextStyle get pageTitle =>textStyle.copyWith(
      fontSize:24,
      fontWeight: FontWeight(700),
      color: primaryOnBackgroundColor
  );
   TextStyle get profileLabelText =>pageDesc.copyWith(fontSize: 15,fontWeight:FontWeight(600));
   TextStyle get profileValueText =>pageDesc.copyWith(color: primaryOnBackgroundColor, fontSize: 15);


   TextStyle get sectionTitle =>textStyle.copyWith(
      fontSize:16,
      fontWeight: FontWeight(700),
      color: primaryOnBackgroundColor
  );

   TextStyle get pageDesc =>textStyle.copyWith(
      fontSize:14,
      fontWeight: FontWeight(400),
      color:descTextColor
  );

   TextStyle get navigationTextStyle =>textStyle.copyWith(
      fontSize:13,
      fontWeight: FontWeight(400),
      color:navigationTextColor
  );

   TextStyle get textFieldHint =>textStyle.copyWith(
      fontSize:14,
      fontWeight: FontWeight(500),
      color:primaryOnBackgroundColor
  );

   TextStyle get categoryCardTitleStyle =>textStyle.copyWith(
      fontSize:13,
      fontWeight: FontWeight(600),
      color:secondaryOnBackgroundColor
  );

   TextStyle get cardProductNameStyle =>textStyle.copyWith(
    fontSize:13,
    fontWeight: FontWeight(700),
    color: primaryCardOnBackgroundColor,
  );

   TextStyle get cardCompanyNameStyle =>textStyle.copyWith(
    fontSize:13,
    fontWeight: FontWeight(700),
    color: descTextColor,
  );

   TextStyle get cardPriceStyle =>textStyle.copyWith(
    fontSize:15,
    fontWeight: FontWeight(700),
    color: primaryCardOnBackgroundColor,
  );

  TextStyle get cardDiscountStyle =>textStyle.copyWith(
    fontSize:10,
    fontWeight: FontWeight(400),
    color: discountCardOnBackgroundColor,
  );
  TextStyle get cardCurrentPriceStyle =>productBasePriceStyle.copyWith(fontSize: 13);
  TextStyle get productBasePriceStyle =>cardCompanyNameStyle.copyWith(fontSize: 20,decoration: TextDecoration.lineThrough, decorationColor:descTextColor,decorationThickness: 2);
  TextStyle get productCurrentPriceStyle =>cardPriceStyle.copyWith(fontSize: 24);
  TextStyle get productNameStyle =>textStyle.copyWith(
    fontSize:20,
    fontWeight: FontWeight(700),
    color: primaryOnBackgroundColor,
  );
  TextStyle get productStockStyle =>textStyle.copyWith(
    fontSize:15,
    fontWeight: FontWeight(300),
    color: primaryOnBackgroundColor,
  );
   TextStyle get productSectionTitle =>sectionTitle.copyWith(fontSize: 19);
  TextStyle get productDesc =>productStockStyle.copyWith(fontWeight:FontWeight(400));
  InputBorder get textFieldBorder =>OutlineInputBorder(borderSide: BorderSide(width: 1,color: descTextColor),borderRadius: BorderRadius.circular(10  ));
  InputDecoration  textFieldDecoration({required String label, required String hintText,required IconData iconData,IconData? suffixIcon,Function? onSuffixIconClicked}){
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
      labelStyle: textFieldHint,
      hintStyle: textFieldHint,
      enabledBorder:textFieldBorder,
      focusedBorder: textFieldBorder.copyWith(borderSide:  BorderSide(width: 2,color: secondaryBackgroundColor)),
      border:textFieldBorder,


    );
  }

}


