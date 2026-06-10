import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import '../../../core/themes/light_theme.dart';
import '../bloc/home_event.dart';
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
    return Scaffold(
      backgroundColor: LightTheme.primaryBackgroundColor,
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (context,HomeState state) {
          if(state.isCurrentProductDataLoading)return Center(child: CircularProgressIndicator(),);
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: LightTheme.pageHorizontalMargin,
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: LightTheme.pageHorizontalMargin,
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: LayoutBuilder(
                              builder: (context, constraints){
                                return state.currentProduct!.images==null || state.currentProduct!.images!.isEmpty ?
                                Image.asset("assets/product/iphone.png",
                                  fit: BoxFit.fill,
                                  height: constraints.maxWidth,
                                  width: constraints.maxWidth,
                                ):
                                Image.network(state.currentProduct!.images![0],
                                fit: BoxFit.fill,
                                height: constraints.maxWidth,
                                width: constraints.maxWidth,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: InkWell(
                              onTap: () {
                                context.read<HomeBloc>().add(
                                  ToggleFavoriteIDEvent(id: state.currentProduct!.id),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: LightTheme.primaryCardBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: state.favoriteProductIds.contains(
                                  state.currentProduct!.id,
                                ) ? Icon(
                                  Icons.favorite,
                                  size: 28,
                                  color: Colors.red,
                                )
                                    : Icon(Icons.favorite_outline, size: 28),

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
                            color: LightTheme.discountCardBackgroundColor,
                          ),
                          child: Text(
                            "${state.currentProduct!.discountPercentage??"00"}%",
                            style: LightTheme.cardDiscountStyle,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("\$${state.currentProduct!.price}", style: LightTheme.productBasePriceStyle),
                        SizedBox(width: 10),
                        Text(
                          "\$${HelperFunctions.calculateDiscountedPrice(state.currentProduct!.price,state.currentProduct!.discountPercentage)}",
                          style: LightTheme.productCurrentPriceStyle,
                        ),
                        Spacer(),
                        Icon(Icons.share),
                      ],
                    ),
                    Text(
                      state.currentProduct!.title??"Product Title",
                      style: LightTheme.productNameStyle,
                    ),
                    Row(
                      children: [
                        Text("Stock: ", style: LightTheme.productStockStyle),
                        Text(
                            HelperFunctions.getStockStateLabel(state.currentProduct!.stock),
                          style: LightTheme.productStockStyle.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      state.currentProduct!.brand??"Brand Name",
                      style: LightTheme.productStockStyle.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    MyButton.primaryButton(text: "Checkout", onTap: () {}),
                    SizedBox(height: 10),
                    Text("Description", style: LightTheme.productSectionTitle),

                    Text(
                      state.currentProduct!.description??"Product Description",
                      style: LightTheme.productDesc,
                    ),
                    SizedBox(height: 10),

                    Text(
                      "Specifications",
                      style: LightTheme.productSectionTitle,
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
                      backGroundColor: LightTheme.secondaryCardBackgroundColor,
                    ),

                    SizedBox(height: 10),
                    Text(
                      "Customer Reviews",
                      style: LightTheme.productSectionTitle,
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
