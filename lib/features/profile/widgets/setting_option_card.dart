import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class SettingOptionCard extends StatelessWidget {
  final IconData iconsData;
  final String tittle;
  final String description;
  final Function onTap;
  const SettingOptionCard({super.key,required this.iconsData,required this.tittle,required this.description,required this.onTap});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Row(
        spacing: 15,
        children: [
          SizedBox(width: 5,),
          Icon(iconsData,
            color: theme.secondaryBackgroundColor,
            size: 30,
          ),
          Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tittle,
                  style:theme.sectionTitle
              ),
              Text(description,
                  style:theme.cardCompanyNameStyle
              )
            ],
          )
        ],
      ),
    );
  }
}
