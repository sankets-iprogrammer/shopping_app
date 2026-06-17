import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/core/helpers/helper_functions.dart';
import 'package:shopping_app/core/helpers/u_uid_generator.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_event.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';
import 'package:shopping_app/features/profile/screens/order_details_screen.dart';

import '../../../core/helpers/overlay_widgets.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../home_page/model/product_model.dart';
import '../../main_screen/bloc/main_screen_bloc.dart';
import '../../profile/screens/add_address_form_screen.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';
import '../widgets/bill_details_card.dart';
import '../widgets/cart_product_card.dart';
import '../widgets/choose_address_list.dart';
import '../widgets/choose_payment_method_list.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return BlocConsumer<CartBloc,CartState>(
      listener: (context,state)async{
        if(state.placeOrderStatus==LoadingStatus.success){
          await showOverlayAnimation(context,assetsAddress: "assets/animations/success.json",duration: Duration(seconds: 3));
          if(state.currentOrder==null)return;
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OrderDetailsScreen(order: state.currentOrder!)));
        }
      },
      builder: (context,state) {
        double productTotalPrice=0;
        double shippingFee=4;
        double taxFee=8;
        final List<ProductModel> cartProducts = context.watch<HomeBloc>().state.products.where((
            ProductModel product,
            ) {
          if(state.productCartCount.containsKey(product.id)){
            productTotalPrice+=HelperFunctions.calculateDiscountedPrice(product.price, product.price ,count:state.productCartCount[product.id])??product.price??0;
            return true;
          }else{
            return false;
          }
        }).toList();
        return Scaffold(
          backgroundColor: theme.primaryBackgroundColor,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomAppbar.featureAppbar("Cart",context: context,goBack: true,theme:theme),
                      cartProducts.isEmpty?
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                        child: Column(
                          children: [
                            SizedBox(height: 40,),
                            Center(child: Lottie.asset('assets/animations/empty_cart.json',height: 350,)),
                            SizedBox(height: 40,),
                            Text("Your cart is empty",
                              style: theme.pageTitle,
                            ),
                            SizedBox(height: 10,),
                            Text("Discover our latest arrivals to find your next favorite piece.",style: theme.productDesc,textAlign: TextAlign.center,),
                            SizedBox(height: 20,),
                            MyButton.primaryButton(theme:theme,text: "Continue Shopping", onTap: (){
                              context.read<MainScreenBloc>().add(SetPageIndexEvent(index: 0));
                              Navigator.pop(context);
                            }),
                            SizedBox(height: 20,),
                            MyButton.secondaryButton(theme:theme,text: "View Wishlist", onTap: (){
                              context.read<MainScreenBloc>().add(SetPageIndexEvent(index: 2));
                              Navigator.pop(context);
                            })
                          ],
                        ),
                      ):
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: theme.pageHorizontalMargin),
                        child:
                        Column(
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
                                border: Border.all(color: theme.specBorderColor)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Promo code",
                                        hintStyle: theme.textFieldHint.copyWith(fontWeight: FontWeight(700))
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.4,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7,horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: theme.secondaryBackgroundColor,
                                      ),
                                      child: Text("Apply",
                                        style: theme.textFieldHint.copyWith(color: theme.secondaryOnBackgroundColor,fontWeight: FontWeight(600)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            BillDetailsCard(productTotalPrice: productTotalPrice,shippingFee: shippingFee,taxFee: taxFee,totalPrice: (productTotalPrice+shippingFee+taxFee))
                          ],
                        ),
                      ),
                      SizedBox(height: 100,)
                    ],
                  ),
                ),
                cartProducts.isEmpty?SizedBox():
                Positioned(
                  left:0,
                    right: 0,
                    bottom: 10,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                      child: MyButton.primaryButton(theme:theme,loading: context.read<CartBloc>().state.placeOrderStatus==LoadingStatus.loading,text: "Place Order",
                          onTap: ()async{
                        if(state.selectedPaymentMethod==null){
                          showModalBottomSheet(
                              backgroundColor: theme.primaryBackgroundColor,
                              context: context,
                              builder: (context){
                                return ChoosePaymentMethodList();
                              });
                          return;
                        }else if(state.selectedAddress==null){
                          showModalBottomSheet(
                              backgroundColor: theme.primaryBackgroundColor,
                              context: context,
                              builder: (context){
                                return ChooseAddressList();
                              });
                          return;
                        }
                        OrderModel order = OrderModel(orderId: UUidGenerator.getUniqueKey(),
                            placedOn: DateTime.now(),
                            orderStatusIndex: 0,
                            productTotalPrice: productTotalPrice,
                            totalPrice: productTotalPrice+taxFee+shippingFee,
                            shippingFee: shippingFee,
                            taxFee: taxFee,
                            paymentMethod: state.selectedPaymentMethod!,
                            address: state.selectedAddress!,
                            products: cartProducts.map((product){return OrderProductModel(product: product, quantity: state.productCartCount[product.id]??0, price: HelperFunctions.calculateDiscountedPrice(product.price, product.discountPercentage)??product.price!);}).toList().cast<OrderProductModel>()
                        );
                        context.read<CartBloc>().add(PlaceOrderEvent(order: order));
                        log("confirmed");
                      }),
                    ))
              ],
            ),
          ),
        );
      }
    );
  }
}
