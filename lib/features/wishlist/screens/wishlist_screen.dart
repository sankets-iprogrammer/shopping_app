import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import '../../home_page/components/product_card.dart';
import '../../home_page/model/product_model.dart';
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeState homeState = context.read<HomeBloc>().state;

    final List<ProductModel> favoriteProducts = homeState.products.where((ProductModel product){
     return homeState.favoriteProductIds.contains(product.id);
    }).toList();

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin,vertical: LightTheme.pageVerticalMargin),
          child: Column(
            mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wishlist",style: LightTheme.pageTitle,),
              SizedBox(height: 24,),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:favoriteProducts.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.68,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  maxCrossAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: favoriteProducts[index],state: context.read<HomeBloc>().state,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
