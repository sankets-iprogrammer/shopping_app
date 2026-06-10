import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';

import '../../home_page/bloc/home_bloc.dart';
import '../../home_page/bloc/home_event.dart';
import '../../home_page/helpers/helper_functions.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel product;
  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: LightTheme.primaryCardBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        spacing: 15,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: LightTheme.primaryBackgroundColor,
            ),
              child: product.images == null || product.images!.isEmpty ?
              Image.asset('assets/product/iphone.png', fit: BoxFit.fill,) :
              CachedNetworkImage(imageUrl: product.images![0],
                placeholder: (context, url) {
                  return Icon(Icons.broken_image, size: 30,
                    color: LightTheme.primaryCardBackgroundColor,);
                },
                errorWidget: (context, url, error) {
                  return Icon(Icons.broken_image, size: 30,
                    color: LightTheme.primaryCardBackgroundColor,);
                },
              )
          ),
          Expanded(
            child: Column(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.brand??"----",
                  style: LightTheme.cardCompanyNameStyle,
                ),
                Text(product.title??"Product Name",
                  style: LightTheme.cardProductNameStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  spacing: 10,
                  children: [
                    InkWell(
                      onTap: (){
                        context.read<HomeBloc>().add(
                          ChangeProductCartCountEvent(
                            id: product.id,
                            desc: true,
                          ),
                        );
                      },
                      child:Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LightTheme.primaryBackgroundColor,
                        ),
                        child: Icon(Icons.remove,color: LightTheme.primaryOnBackgroundColor,size: 15),
                      ) ,
                    ),
                    BlocBuilder<HomeBloc,HomeState>(builder: (context,state){
                      return Text(state.productCartCount[product
                          .id]
                          .toString(),);
                    }),

                    InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(
                          ChangeProductCartCountEvent(
                            id: product.id,
                          ),
                        );
                      },
                      child:Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LightTheme.secondaryBackgroundColor,
                        ),
                        child: Icon(Icons.add,color: LightTheme.secondaryOnBackgroundColor,size: 15,),
                      ) ,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text("\$${product.price}", style: LightTheme.cardCurrentPriceStyle),
              SizedBox(width: 10),
              Text(
                "\$${calculateDiscountedPrice(product.price,product.discountPercentage)}",
                style: LightTheme.cardPriceStyle,
              ),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}
