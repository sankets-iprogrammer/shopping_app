import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_storage.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';
import 'package:shopping_app/features/profile/widgets/order_card.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/widgets/custom_appbar.dart';


class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrderModel> orders = RealmDBStorage.getOrders();
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return BlocBuilder<ProfileBloc,ProfileState>(
        builder: (context,state) {
          return Scaffold(
            backgroundColor: theme.primaryBackgroundColor,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      CustomAppbar.featureAppbar(theme: theme, "Orders",context: context,goBack: true),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                        child:
                        orders.isEmpty?
                        Column(
                          children: [
                            SizedBox(height: 40,),
                            Center(child: Lottie.asset('assets/animations/empty.json',height: 350,)),
                            Text("No orders yet.",
                              style: theme.pageTitle,
                            ),
                            SizedBox(height: 10,),
                            Text("Place a new order....",style: theme.productDesc,textAlign: TextAlign.center,),
                            SizedBox(height: 20,),
                          ],
                        ):
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context,index){
                              log("render order $index");
                              return Padding(
                                padding: const EdgeInsets.only(bottom:20),
                                child: OrderCard(order: orders[index]),
                              );
                            }),
                      ),
                      SizedBox(height: 60,)
                    ]
                ),
              ),
            ),
          );
        }
    );
  }
}
