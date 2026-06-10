import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/helper_functions.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/cart_and_order/widgets/payment_method_card.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../home_page/model/product_model.dart';
import '../widgets/address_card.dart';
import '../widgets/cart_product_card.dart';
import '../widgets/choose_address_list.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,state) {
        double totalPrice=0;
        double shippingFee=4;
        double taxFee=8;
        final List<ProductModel> cartProducts = state.products.where((
            ProductModel product,
            ) {
          if(state.productCartCount.containsKey(product.id)){
            totalPrice+=HelperFunctions.calculateDiscountedPrice(product.price, product.price)??product.price??0;
            return true;
          }else{
            return false;
          }
        }).toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar.featureAppbar("Cart",context: context,goBack: true),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: LightTheme.pageHorizontalMargin),
                child: Column(
                  children: [
                      ListView.builder(
                        itemCount: cartProducts.length,
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                        return CartProductCard(product:cartProducts[index]);
                      }),
                    Container(
                      margin: EdgeInsets.only(top:15,bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: LightTheme.specBorderColor)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Promo code",
                                hintStyle: LightTheme.textFieldHint.copyWith(fontWeight: FontWeight(700))
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 7,horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: LightTheme.secondaryBackgroundColor,
                              ),
                              child: Text("Apply",
                                style: LightTheme.textFieldHint.copyWith(color: LightTheme.secondaryOnBackgroundColor,fontWeight: FontWeight(600)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: LightTheme.specBorderColor)
                      ),
                      child: Column(
                        children: [
                          Column(
                            spacing: 8  ,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal",style: LightTheme.cartPriceText,),
                                  Text("\$${totalPrice.toStringAsFixed(2)}",style: LightTheme.cartPriceText,)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Shipping Fee",style: LightTheme.cartPriceText,),
                                  Text("\$32.0",style: LightTheme.cartPriceText,)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tax Fee",style: LightTheme.cartPriceText,),
                                  Text("\$231.0",style: LightTheme.cartPriceText,)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order Total",style: LightTheme.cartTotalPriceText,),
                              Text("\$${(totalPrice+shippingFee+taxFee).toStringAsFixed(2)}",style: LightTheme.cartTotalPriceText,)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(color: LightTheme.specBorderColor,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Payment Method",
                                  style:LightTheme.cartTotalPriceText.copyWith(fontSize: 19)),
                              InkWell(
                                child: Text("Change",style: LightTheme.navigationTextStyle,),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          PaymentMethodCard(),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Shipping Address",
                                style:LightTheme.cartTotalPriceText.copyWith(fontSize: 19)),
                              InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context){
                                    return ChooseAddressList();
                                  });
                                },
                                child: Text("Change",style: LightTheme.navigationTextStyle,),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          // AddressCard(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
