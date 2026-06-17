import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/cached_network_image.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../cart_and_order/bloc/cart_bloc.dart';
import '../../cart_and_order/bloc/cart_event.dart';
import '../bloc/home_event.dart';
import '../components/change_product_count_bar.dart';
import '../components/review_card.dart';
import '../components/specification_card.dart';
import '../../../core/helpers/helper_functions.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Scaffold(
      backgroundColor: theme.primaryBackgroundColor,
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (context,HomeState state) {
          if(state.isCurrentProductDataLoading)return Center(child: CircularProgressIndicator(),);
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: theme.pageHorizontalMargin,
                vertical: theme.pageVerticalMargin
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back,color: theme.primaryOnBackgroundColor,)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: theme.pageHorizontalMargin,
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: LayoutBuilder(
                              builder: (context, constraints){
                                return MyCachedNetworkImage(imageUrl: state.currentProduct?.images?[0]??"",height: constraints.maxWidth,width: constraints.maxWidth,);
                              },
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: InkWell(
                              onTap: () {
                                context.read<CartBloc>().add(
                                  ToggleFavoriteIDEvent(id: state.currentProduct!.id),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: theme.primaryCardBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: context.watch<CartBloc>().state.favoriteProductIds.contains(
                                  state.currentProduct!.id,
                                ) ? Icon(
                                  Icons.favorite,
                                  size: 28,
                                  color: Colors.red,
                                )
                                    : Icon(Icons.favorite_outline, size: 28,color: theme.primaryOnBackgroundColor,),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: theme.discountCardBackgroundColor,
                          ),
                          child: Text(
                            "${state.currentProduct!.discountPercentage??"00"}%",
                            style: theme.cardDiscountStyle,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("\$${state.currentProduct!.price}", style: theme.productBasePriceStyle),
                        SizedBox(width: 10),
                        Text(
                          "\$${HelperFunctions.calculateDiscountedPrice(state.currentProduct!.price,state.currentProduct!.discountPercentage)}",
                          style: theme.productCurrentPriceStyle,
                        ),
                        Spacer(),
                        Icon(Icons.share,color: theme.primaryOnBackgroundColor,),
                      ],
                    ),
                    Text(
                      state.currentProduct!.title??"Product Title",
                      style: theme.productNameStyle,
                    ),
                    Row(
                      children: [
                        Text("Stock: ", style: theme.productStockStyle),
                        Text(HelperFunctions.getStockStateLabel(state.currentProduct!.stock),
                          style: theme.productStockStyle.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      state.currentProduct!.brand??"Brand Name",
                      style: theme.productStockStyle.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    MyButton.primaryButton(
                      theme:theme,
                      text:"Add",
                      onTap:(){
                        log("added");;
                           if(BlocProvider.of<CartBloc>(context, listen: false).state.productCartCount[state.currentProduct!.id]!=null)return;
                        BlocProvider.of<CartBloc>(context, listen: false).add(
                             ChangeProductCartCountEvent(
                               id:state.currentProduct!.id,
                             ),
                           );
                      },
                      widget: context.watch<CartBloc>().state.productCartCount[state.currentProduct!.id]!=null?ChangeProductCountBar():null
                    ),
                    SizedBox(height: 10),
                    Text("Description", style: theme.productSectionTitle),

                    Text(
                      state.currentProduct!.description??"Product Description",
                      style: theme.productDesc,
                    ),
                    SizedBox(height: 10),

                    Text(
                      "Specifications",
                      style: theme.productSectionTitle,
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        SpecificationCard(
                          title: "Weight",
                          value: state.currentProduct!.weight ==null?"--": "${state.currentProduct!.weight.toString()}g",
                          width: double.infinity,
                        ),
                        SpecificationCard(
                          title: "SHIPPING",
                          value: state.currentProduct!.shippingInformation??"--",
                          width: double.infinity,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        SpecificationCard(
                          title: "Weight",
                          value: "2g",
                          width: double.infinity,
                        ),
                        SpecificationCard(
                          title: "WARRANTY",
                          value: state.currentProduct!.warrantyInformation?? "--",
                          width: double.infinity,
                        ),
                      ],
                    ),
                    SpecificationCard(
                      title: "DIMENSIONS",
                      value: HelperFunctions.getDimensionText(state.currentProduct!.dimensions),
                      width: double.infinity,
                      backGroundColor: theme.primaryCardBackgroundColor,
                    ),

                    SizedBox(height: 10),
                    Text(
                      "Customer Reviews",
                      style: theme.productSectionTitle,
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.currentProduct!.reviews!.length,
                      itemBuilder: (context, index) {
                       return ReviewCard(review:state.currentProduct!.reviews![index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
