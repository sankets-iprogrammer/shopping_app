import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        SizedBox(width: 15,),
        Image.asset('assets/category_icons/sports.png',height: 25,width: 25,),
        Text("Master Card",style: LightTheme.cartTotalPriceText,)
      ],
    );
  }
}
