import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class SpecificationCard extends StatelessWidget{
  final String title;
  final String value;
  final double width;
  final Color? backGroundColor;
  const SpecificationCard({super.key,required this.title,required this.value,required this.width,this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Flexible(
      child: Container(
        width: width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.specBorderColor),
          color: backGroundColor
        ),
        child: Column(
          spacing: 3,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: theme.cardCompanyNameStyle,),
            Text(value,style: theme.productDesc.copyWith(fontWeight: FontWeight(700)),)
          ],
        ),
      ),
    );
  }
}