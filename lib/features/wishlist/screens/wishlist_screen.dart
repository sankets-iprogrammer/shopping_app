import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import '../../home_page/components/product_card.dart';
import '../../home_page/model/product_model.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final List<ProductModel> favoriteProducts = state.products.where((
          ProductModel product,
        ) {
          return state.favoriteProductIds.contains(product.id);
        }).toList();
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar.featureAppbar("Wishlist",context: context),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: LightTheme.pageHorizontalMargin,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    favoriteProducts.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3,
                            ),
                            child: Column(
                              spacing: 10,
                              children: [
                                Text("Wishlist is Empty",style: LightTheme.productDesc),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(
                                    color: LightTheme.primaryCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("Continue Shopping",style: LightTheme.cardProductNameStyle,),
                                )
                              ],
                            ),
                          )
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: favoriteProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio: 0.68,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  maxCrossAxisExtent: 300,
                                ),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: favoriteProducts[index],
                                state: context.read<HomeBloc>().state,
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
