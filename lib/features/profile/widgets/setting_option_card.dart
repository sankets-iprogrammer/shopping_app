import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';

class SettingOptionCard extends StatelessWidget {
  final IconData iconsData;
  final String tittle;
  final String description;
  final Function onTap;
  const SettingOptionCard({super.key,required this.iconsData,required this.tittle,required this.description,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Row(
        spacing: 15,
        children: [
          SizedBox(width: 5,),
          Icon(iconsData,
            color: LightTheme.secondaryBackgroundColor,
            size: 30,
          ),
          Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tittle,
                  style:LightTheme.sectionTitle
              ),
              Text(description,
                  style:LightTheme.cardCompanyNameStyle
              )
            ],
          )
        ],
      ),
    );
  }
}
