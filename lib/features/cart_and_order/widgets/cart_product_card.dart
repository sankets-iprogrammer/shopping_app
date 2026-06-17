import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/cached_network_image.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../home_page/bloc/home_bloc.dart';
import '../../home_page/bloc/home_event.dart';
import '../../../core/helpers/helper_functions.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel product;
  final double? fixedPrice;
  final int? productQuantity;
  const CartProductCard({super.key, required this.product ,this.fixedPrice, this.productQuantity});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: theme.primaryCardBackgroundColor,
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
              color: theme.primaryBackgroundColor,
            ),
              child: product.images == null || product.images!.isEmpty ?
              Image.asset('assets/product/iphone.png', fit: BoxFit.fill,) :
                  MyCachedNetworkImage(imageUrl: product.images![0]),
          ),
          Expanded(
            child: Column(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.brand??"----",
                  style: theme.cardCompanyNameStyle,
                ),
                Text(product.title??"Product Name",
                  style: theme.cardProductNameStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                productQuantity!=null?Text("Total Quantity : $productQuantity",style:  theme.cardProductNameStyle,):
                Row(
                  spacing: 10,
                  children: [
                    InkWell(
                      onTap: (){
                        context.read<CartBloc>().add(
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
                          color: theme.primaryBackgroundColor,
                        ),
                        child: Icon(Icons.remove,color: theme.primaryOnBackgroundColor,size: 15),
                      ) ,
                    ),
                    BlocBuilder<CartBloc,CartState>(builder: (context,state){
                      return Text(state.productCartCount[product
                          .id]
                          .toString(),style: theme.productDesc,);
                    }),

                    InkWell(
                      onTap: () {
                        context.read<CartBloc>().add(
                          ChangeProductCartCountEvent(
                            id: product.id,
                          ),
                        );
                      },
                      child:Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.secondaryBackgroundColor,
                        ),
                        child: Icon(Icons.add,color: theme.secondaryOnBackgroundColor,size: 15,),
                      ) ,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              fixedPrice!=null?SizedBox():
              Text("\$${product.price}", style: theme.cardCurrentPriceStyle),
              SizedBox(width: 10),
              Text(
                "\$${fixedPrice?? HelperFunctions.calculateDiscountedPrice(product.price,product.discountPercentage)}",
                style: theme.cardPriceStyle,
              ),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}
