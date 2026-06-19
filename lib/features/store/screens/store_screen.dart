import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/app_theme.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/core/widgets/search_bar.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/store/bloc/store_event.dart';
import '../../../core/helpers/custom_shimmer.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../home_page/components/product_card.dart';
import '../../home_page/model/product_model.dart';
import '../bloc/store_bloc.dart';
import '../bloc/store_state.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch<ThemeBloc>().state.currentTheme;
    return BlocConsumer<StoreBloc, StoreState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar.featureAppbar("Store", context: context, theme: theme),
          SizedBox(height: 30,),
          MySearchBar(
            searchFocusNode: searchFocusNode,
              onChanged: (value) {
                if (value
                    .trim()
                    .isEmpty) return;
                context.read<StoreBloc>().add(SearchStoreProductEvent(
                    searchText: value.trim().toLowerCase()));
              },
              onSubmitted: (value) {
                if (value
                    .trim()
                    .isEmpty) return;
                context.read<StoreBloc>().add(SearchStoreProductEvent(
                    searchText: value.trim().toLowerCase()));
              },
              onClear: () {
                context.read<StoreBloc>().add(
                    SearchStoreProductEvent(searchText: ""));
                searchController.clear();
              },
              controller: searchController),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.widthOf(context),
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      context.read<StoreBloc>().add(GetCategoryProductsEvent(category: state.categories[index]));
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(bottom: state.categories[index]==state.currentCategory?
                            BorderSide(
                              width: 3,
                                color: theme.secondaryBackgroundColor):
                            BorderSide(
                                color: theme.primaryOnBackgroundColor
                                    .withAlpha(100))
                        ),),
                        child: Text(
                            state.categories[index], style:state.categories[index]==state.currentCategory?theme.storeCategoryText.copyWith(color:theme.secondaryBackgroundColor,fontWeight: FontWeight(900)):theme.storeCategoryText)),
                  );
                }),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin,vertical: theme.pageVerticalMargin),
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:state.categoryProductsLoadingStatus==LoadingStatus.loading?4:state.filteredProducts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.68,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                if(state.categoryProductsLoadingStatus==LoadingStatus.loading){
                  return CustomShimmer.getShimmerProductCard();
                }
                final ProductModel product = state.filteredProducts[index];
                return ProductCard(product: product);
              },
            ),
          )
        ],
      ),
    );
  },
);
  }
}
