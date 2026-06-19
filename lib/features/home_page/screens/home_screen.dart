
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/custom_shimmer.dart';
import 'package:shopping_app/core/helpers/custom_snackbar.dart';
import 'package:shopping_app/core/widgets/search_bar.dart';
import 'package:shopping_app/features/home_page/bloc/home_event.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/home_page/components/product_card.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/widgets/buttons.dart';
import '../../store/bloc/store_bloc.dart';
import '../../store/bloc/store_event.dart';
import '../bloc/home_bloc.dart';
import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();
  CarouselSliderController carouselController = CarouselSliderController();
  FocusNode searchFocusNode=FocusNode();
  List<String> contents = [
    'assets/offers/offer_1.jpg',
    'assets/offers/offer_2.jpeg',
    'assets/offers/offer_3.jpeg'
  ];

  int currentIndex = 0;
  final ScrollController _scrollController =ScrollController();

  void _scrollListener(){
    if(_scrollController.position.extentAfter < 500){
      if(context.read<HomeBloc>().state.isProductListLoading){
      }else{
        context.read<HomeBloc>().add(LoadProductListEvent());
      }
    }
}

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = context.watch<StoreBloc>().state.categories;
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context,state){
        if(state.errorMessage!=null){
          CustomSnackBar.showErrorSnackBar(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: ()async{
            context.read<HomeBloc>().add(LoadProductListEvent(firstTime: true));
            context.read<StoreBloc>().add(GetCategoriesEvent());
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.secondaryBackgroundColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(200, 40),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -(width * 0.45),
                            top: -(width * 0.45),
                            child: Container(
                              height: width * 0.8,
                              width: width * 0.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(217, 217, 217, 0.2),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -(width * 0.7),
                            bottom: -(width * 0.4),
                            child: Container(
                              height: width,
                              width: width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(217, 217, 217, 0.2),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 30,
                              bottom: 50,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Good Morning",
                                        style: theme.categoryCardTitleStyle,
                                      ),
                                      Text(
                                        state.isUserDataLoading?
                                        "User"
                                        : "${state.userData?.firstName??"User"} ${state.userData?.lastName??"User"}",
                                        style: theme.sectionTitle.copyWith(
                                          color: theme
                                              .secondaryOnBackgroundColor,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        "Popular Categories",
                                        style: theme.sectionTitle.copyWith(
                                          color: theme
                                              .secondaryOnBackgroundColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                state.isCategoryListLoadingFailed?Padding(
                                  padding: const EdgeInsets.only(top:10,bottom: 20,left: 20),
                                  child: Text("Failed To Load Categories",
                                    style: theme
                                        .categoryCardTitleStyle.copyWith(color: theme.errorTextColor),
                                  ),
                                ):
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  width: double.infinity,
                                  height: 85,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.isCategoryListLoading
                                        ? 10:categories.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          right: 20,
                                          left: index == 0 ? 10 : 0,
                                        ),
                                        child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  context.watch<StoreBloc>().state.categoriesLoadingStatus==LoadingStatus.loading
                                                      ? CustomShimmer.getShimmerContainer(
                                                      height: 55,
                                                      width: 55,
                                                      baseColor: theme
                                                          .primaryBackgroundColor,
                                                      highlightColor: Color(0xFFD4D4D2),
                                                      shape: BoxShape.circle
                                                  ) :
                                                  InkWell(
                                                    onTap: (){
                                                      context.read<StoreBloc>().add(GetCategoryProductsEvent(category: categories[index]));
                                                      context.read<MainScreenBloc>().add(SetPageIndexEvent(index: 1));
                                                    },
                                                    child: Container(
                                                      height: 55,
                                                      width: 55,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: theme
                                                            .primaryBackgroundColor,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/category_icons/sports.png",
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    child: Text(
                                                      overflow: TextOverflow.ellipsis,
                                                      categories[index],
                                                      style: theme
                                                          .categoryCardTitleStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: MySearchBar(
                            searchFocusNode: searchFocusNode,
                              onChanged: (value) {
                            if (value
                                .trim()
                                .isEmpty) return;
                            context.read<HomeBloc>().add(SearchProductEvent(
                                searchText: value.trim().toLowerCase()));
                          },
                              onSubmitted: (value) {
                                if (value
                                    .trim()
                                    .isEmpty) return;
                                context.read<HomeBloc>().add(SearchProductEvent(
                                    searchText: value.trim().toLowerCase()));
                              },
                              onClear: () {
                                context.read<HomeBloc>().add(
                                    SearchProductEvent(searchText: ""));
                                searchController.clear();
                              },
                              controller: searchController)
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.pageHorizontalMargin,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      state.isBannerLoading?
                          CustomShimmer.getShimmerContainer(
                              height: 170,
                              width: width,
                              baseColor: theme.primaryCardBackgroundColor,
                              highlightColor: theme.primaryBackgroundColor,
                            borderRadius: 16
                          ):
                      SizedBox(
                        height: 170,
                        width: double.infinity,
                        child: CarouselSlider(
                          carouselController: carouselController,
                          items: contents.map((content) {
                            return Container(
                              width: double.infinity,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(content,fit: BoxFit.fill),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 10),
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      state.isBannerLoading?
                      CustomShimmer.getShimmerContainer(
                          height: 7,
                          width: 100,
                          baseColor: theme.primaryCardBackgroundColor,
                          highlightColor: theme.primaryBackgroundColor,
                          borderRadius: 10
                      ):
                      MyButton.carouselNavigators(
                        height: 7,
                        width: 100,
                        activeIndex: currentIndex,
                       count:  contents.length,
                        theme: theme
                      ),

                      state.searchText.isEmpty?SizedBox():
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text("Results for : ${state.searchText}",
                                  style: theme.sectionTitle,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  searchController.clear();
                                  context.read<HomeBloc>().add(SearchProductEvent(searchText: ""));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 3,bottom: 3,left: 7,right: 2),
                                  decoration: BoxDecoration(
                                    color: theme.primaryCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Text("clear",style: theme.navigationTextStyle.copyWith(color: theme.primaryOnBackgroundColor),),
                                      Icon(Icons.cancel,size: 19,color: theme.primaryCardOnBackgroundColor,)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),

                      state.isProductListLoadingFailed?
                      Padding(
                        padding: const EdgeInsets.only(top:40),
                        child: Center(child: Text("Failed To Load Products",style: theme.cardCompanyNameStyle.copyWith(color: theme.errorTextColor),),),
                      )
                          :
                      (state.filteredProducts.isEmpty && !state.isProductListLoading)?
                      Padding(
                        padding: const EdgeInsets.only(top:40),
                        child: Center(child: Text("No Match Found",style: theme.cardCompanyNameStyle.copyWith(color: theme.errorTextColor),),),
                      ):
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.filteredProducts.length+(state.isProductListLoading?4:0),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.68,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          maxCrossAxisExtent: 300,
                        ),
                        itemBuilder: (context, index) {
                          if(index>=state.filteredProducts.length){
                            return CustomShimmer.getShimmerProductCard();
                          }
                          final ProductModel product = state.filteredProducts[index];
                           return ProductCard(product: product);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
