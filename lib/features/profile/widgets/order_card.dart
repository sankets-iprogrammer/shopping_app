import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/app_theme.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';
import 'package:shopping_app/features/profile/screens/order_details_screen.dart';

import '../../../core/helpers/helper_functions.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.read<ThemeBloc>().state.currentTheme;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailsScreen(order: order)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.primaryCardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFA9CBAA),
                  ),
                  child: Text(
                    "Order Placed",
                    style: TextStyle(
                      color: Color(0xFF024303),
                      fontWeight: FontWeight(600),
                      fontSize: 12,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_outlined,size: 15,color: theme.primaryOnBackgroundColor,)
              ],
            ),
            Text(order.orderId, style: theme.productDesc),
            Text("3 items", style: theme.cardProductNameStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${order.totalPrice.toStringAsFixed(2)}",
                  style: theme.cardPriceStyle,
                ),
                Text(
                  HelperFunctions.getDateTimeString(order.placedOn),
                  style: theme.cardCompanyNameStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
