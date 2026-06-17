import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/cart_and_order/widgets/payment_method_card.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../bloc/cart_bloc.dart';
import 'address_card.dart';
import 'choose_address_list.dart';
import 'choose_payment_method_list.dart';
class BillDetailsCard extends StatelessWidget {
  final double totalPrice;
  final double productTotalPrice;
  final double shippingFee;
  final double taxFee;
  final bool readOnly;
  final PaymentMethodModel? paymentMethod;
  final AddressModel? address;
  const BillDetailsCard({super.key,required this.productTotalPrice, required this.totalPrice,required this.shippingFee,required this.taxFee,this.readOnly=false,this.paymentMethod,this.address});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    print(address);
    print(paymentMethod);
    return Container(
      padding: EdgeInsets.all(16),
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.specBorderColor)
      ),
      child: Column(
        children: [
          Column(
            spacing: 8  ,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal",style: theme.cartPriceText,),
                  Text("\$${productTotalPrice.toStringAsFixed(2)}",style: theme.cartPriceText,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping Fee",style: theme.cartPriceText,),
                  Text("\$$shippingFee",style: theme.cartPriceText,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tax Fee",style: theme.cartPriceText,),
                  Text("\$$taxFee",style: theme.cartPriceText,)
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order Total",style: theme.cartTotalPriceText,),
              Text("\$${totalPrice.toStringAsFixed(2)}",style: theme.cartTotalPriceText,)
            ],
          ),
          SizedBox(height: 5,),
          Divider(color: theme.specBorderColor,),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Payment Method",
                  style:theme.cartTotalPriceText.copyWith(fontSize: 17)),
              readOnly? SizedBox():InkWell(
                onTap: (){
                  showModalBottomSheet(
                    backgroundColor: theme.primaryBackgroundColor,
                      context: context,
                      builder: (context){
                        return ChoosePaymentMethodList();
                      });
                },
                child: Text("Change",style: theme.navigationTextStyle,),
              )
            ],
          ),
          SizedBox(height: 10,),
          paymentMethod ==null && context.watch<CartBloc>().state.selectedPaymentMethod==null?
          SizedBox():
          PaymentMethodCard(paymentMethod:paymentMethod??context.watch<CartBloc>().state.selectedPaymentMethod!,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Shipping Address",
                  style:theme.cartTotalPriceText.copyWith(fontSize: 17)),
              readOnly? SizedBox():InkWell(
                onTap: (){
                  showModalBottomSheet(
                      backgroundColor: theme.primaryBackgroundColor,
                      context: context,
                      builder: (context){
                        return ChooseAddressList();
                      });
                },
                child: Text("Change",style: theme.navigationTextStyle,),
              )
            ],
          ),
          SizedBox(height: 10,),
          address==null && context.watch<CartBloc>().state.selectedAddress==null?
          SizedBox():
          AddressCard(address:address??context.watch<CartBloc>().state.selectedAddress!,readOnly: true,),
        ],
      ),
    );
  }
}
