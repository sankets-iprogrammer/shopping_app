
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class ThemeCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final IconData iconData;
  const ThemeCard({super.key,this.isSelected=false,required this.title,required this.iconData});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:isSelected? Border.all(color: theme.secondaryBackgroundColor) : null
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(iconData,size: 27,color: theme.primaryOnBackgroundColor,),
          Text(title,style: theme.cartTotalPriceText,),
          Spacer(),
          isSelected?
          Radio(
            value: true,
            groupValue: true,
            fillColor: WidgetStatePropertyAll(theme.secondaryBackgroundColor) ,
          ):
          SizedBox()
        ],
      ),
    );
  }
}