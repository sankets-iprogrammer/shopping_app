import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  const PaymentMethodCard({super.key,required this.paymentMethod,this.isSelected=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:isSelected? Border.all(color: LightTheme.secondaryBackgroundColor) : null
      ),
      child: Row(
        spacing: 10,
        children: [
          Image.network(paymentMethod.image,height: 35,width: 35,),
          Text(paymentMethod.title,style: LightTheme.cartTotalPriceText,),
          Spacer(),
          isSelected?
          Radio(
            value: true,
            groupValue: true,
            fillColor: WidgetStatePropertyAll(LightTheme.secondaryBackgroundColor) ,
          ):
              SizedBox()
        ],
      ),
    );
  }
}
