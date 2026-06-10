import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../home_page/model/product_model.dart';
import '../widgets/cart_product_card.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context,state) {
        final List<ProductModel> cartProducts = state.products.where((
            ProductModel product,
            ) {
          return state.productCartCount.containsKey(product.id);
        }).toList();
        return Column(
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
                    height: 50,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: LightTheme.specBorderColor)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Promo code",
                        hintStyle: LightTheme.textFieldHint.copyWith(
                          color: LightTheme.descTextColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }
    );
  }
}
