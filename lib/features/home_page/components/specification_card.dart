import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';

class SpecificationCard extends StatelessWidget{
  final String title;
  final String value;
  final double width;
  final Color? backGroundColor;
  const SpecificationCard({super.key,required this.title,required this.value,required this.width,this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: LightTheme.specBorderColor),
          color: backGroundColor
        ),
        child: Column(
          spacing: 3,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: LightTheme.cardCompanyNameStyle,),
            Text(value,style: LightTheme.productDesc.copyWith(fontWeight: FontWeight(700)),)
          ],
        ),
      ),
    );
  }
}