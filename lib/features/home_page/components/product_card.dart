import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/features/home_page/screens/product_screen.dart';
import '../../../core/helpers/cached_network_image.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../cart_and_order/bloc/cart_bloc.dart';
import '../../cart_and_order/bloc/cart_event.dart';
import '../../cart_and_order/bloc/cart_state.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class ProductCard extends StatelessWidget{
  final ProductModel product;
  const ProductCard({super.key,required this.product});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    return InkWell(
      onTap: (){
        context.read<HomeBloc>().add(LoadProductDataEvent(id: product.id));
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen()));
      },
      child: LayoutBuilder(
        builder: (context,constraints) {
          double width = constraints.maxWidth;
          return Stack(
            children: [
                   Container(
                    padding: EdgeInsets.all(7),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color:
                      theme.primaryCardBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          height: width,
                          decoration: BoxDecoration(
                            color:
                            theme.primaryBackgroundColor,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: product.images == null
                              ? Icon(Icons.broken_image,size: 30,color: theme.primaryCardBackgroundColor,)
                              :MyCachedNetworkImage(imageUrl: product.images![0]),
                        ),
                        SizedBox(height: width * 0.02),
                        Text(
                          product.title ?? "Product Name",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.cardProductNameStyle,
                        ),
                        Text(
                          product.brand ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.cardCompanyNameStyle,
                        ),
                        Spacer(),
                        Text(
                          "\$${product.price ?? "----"}",
                          style: theme.cardPriceStyle,
                        ),
                      ],
                    ),
                  ),
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(width * 0.032),
                    // width: width * 0.075,
                    // height: width * 0.075,
                    decoration: BoxDecoration(
                      color:
                      theme.primaryCardOnBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        state.productCartCount.containsKey(
                          product.id,
                        )
                            ? Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<CartBloc>().add(
                                  ChangeProductCartCountEvent(
                                    id: product.id,
                                    desc: true,
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.remove,
                                color: theme
                                    .primaryCardBackgroundColor,
                                size: 23,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Text(
                                state
                                    .productCartCount[product
                                    .id]
                                    .toString(),
                                style: TextStyle(
                                  color: theme.primaryBackgroundColor,
                                  fontWeight: FontWeight(
                                    800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                            : SizedBox(),
                        InkWell(
                          onTap: () {
                            context.read<CartBloc>().add(
                              ChangeProductCartCountEvent(
                                id: product.id,
                              ),
                            );
                          },
                          child: Icon(
                            Icons.add,
                            color: theme
                                .primaryCardBackgroundColor,
                            size: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 7 + width * 0.02,
                top: 7 + width * 0.02,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: theme.discountCardBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    product.discountPercentage == null
                        ? ""
                        : "${product.discountPercentage}%",
                    style: theme.cardDiscountStyle,
                  ),
                ),
              ),
              Positioned(
                right: 7 + width * 0.01,
                top: 7 + width * 0.01,
                child: InkWell(
                  onTap: () {
                    context.read<CartBloc>().add(
                      ToggleFavoriteIDEvent(id: product.id),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color:
                      theme.primaryCardBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child:
                    state.favoriteProductIds.contains(
                      product.id,
                    ) ? Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.red,
                    )
                        : Icon(Icons.favorite_outline, size: 20,color: theme.primaryCardOnBackgroundColor,),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  },
);
  }
}