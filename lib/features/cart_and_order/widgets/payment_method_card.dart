import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/cached_network_image.dart';
import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  const PaymentMethodCard({super.key,required this.paymentMethod,this.isSelected=false});
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
          SizedBox(
          height: 35,width: 35,
              child: MyCachedNetworkImage(imageUrl: paymentMethod.image,height: 35,width: 35)),
          Text(paymentMethod.title,style: theme.cartTotalPriceText,),
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
