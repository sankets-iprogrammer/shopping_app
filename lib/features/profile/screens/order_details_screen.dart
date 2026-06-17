import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/helper_functions.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_bloc.dart';
import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';
import 'package:step_progress/step_progress.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../cart_and_order/widgets/bill_details_card.dart';
import '../../cart_and_order/widgets/cart_product_card.dart';
import '../../home_page/bloc/home_bloc.dart';
import '../../home_page/model/product_model.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel order;
  const OrderDetailsScreen({super.key,required this.order});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.watch<ThemeBloc>().state.currentTheme;
    return BlocBuilder<ProfileBloc, ProfileState>(
  builder: (context, state) {
    final List<ProductModel> cartProducts = context.read<HomeBloc>().state.products.where((
        ProductModel product,
        ) {
      if(context.read<CartBloc>().state.productCartCount.containsKey(product.id)){
        return true;
      }else{
        return false;
      }
    }).toList();
    return Scaffold(
      backgroundColor: theme.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar.featureAppbar(theme: theme, "Order Details", context: context,goBack: true),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFA9CBAA),
                    ),
                    child: Text("Order Placed",style: TextStyle(
                        color: Color(
                        0xFF024303),
                      fontWeight: FontWeight(600)
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("#ORD-${order.orderId}",style: theme.pageTitle,),
                  SizedBox(height: 10,),
                  Text("Placed on  ${HelperFunctions.getDateTimeString(order.placedOn)}",style: theme.sectionTitle,),
                  Stepper(
                    stepIconMargin: EdgeInsets.all(5),
                      margin: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      connectorThickness: 2,
                      // connectorColor:WidgetStatePropertyAll(true? theme.secondaryBackgroundColor: Colors.grey),
                      currentStep: order.orderStatusIndex,
                      controlsBuilder: (context,details){
                        return SizedBox.shrink();
                      },
                      steps: [
                        Step(title: Text("Order Placed",style: theme.sectionTitle,),
                            content: Row(
                              children: [
                                Text("Your order has been placed successfully.",style: theme.productDesc),
                              ],
                            ),
                            isActive: true
                        ),
                        Step(title: Text("Order Confirmed",style: theme.sectionTitle),
                            content: Row(
                              children: [
                                Text(
                                    "We're confirming your order with the seller.",style: theme.productDesc),
                              ],
                            )),
                        Step(title: Text("Processing",style: theme.sectionTitle),
                            content: Row(
                              children: [
                                Text("Your order is currently being prepared.",style: theme.productDesc),
                              ],
                            )),
                        Step(title: Text("Packed",style: theme.sectionTitle),
                            content: Row(
                              children: [
                                Text("Your items are being packed for shipment.",style: theme.productDesc),
                              ],
                            )),
                        Step(title: Text("Shipped",style: theme.sectionTitle),
                            content: Row(
                              children: [
                                Text("We're handing your package to our delivery partner.",style: theme.productDesc),
                              ],
                            )),
                        Step(title: Text("Out for Delivery",style: theme.sectionTitle),
                            content: Row(
                              children: [
                                Text("Your order is with the delivery agent and will arrive soon.",style: theme.productDesc),
                              ],
                            )),

                      ]),
                  SizedBox(height: 20,),
                  Text("Order Items",style: theme.sectionTitle,),
                  SizedBox(height: 10,),
                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                      itemCount: order.products.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return CartProductCard(product:order.products[index].product,fixedPrice:order.products[index].price,productQuantity:order.products[index].quantity,);
                      }),
                  SizedBox(height: 20,),
                  Text("Bill Summary",style: theme.sectionTitle,),
                  SizedBox(height: 10,),
                  BillDetailsCard(readOnly: true,productTotalPrice: order.productTotalPrice, totalPrice: order.totalPrice,shippingFee: order.shippingFee,taxFee: order.taxFee,paymentMethod: order.paymentMethod,address: order.address,),
                  SizedBox(height: 100,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
