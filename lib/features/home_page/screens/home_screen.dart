import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/light_theme.dart';
import '../../../core/widgets/buttons.dart';
import '../../get_started/model/on_boarding_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode searchFocusNode =FocusNode();
  TextEditingController searchController= TextEditingController();
  CarouselSliderController carouselController=CarouselSliderController();
  List<OnBoardingContent> contents = [
    OnBoardingContent(
      title: "Welcome to UP Store",
      desc: "Your one-stop destination for effortless and enjoyable shopping",
      image: Image.asset('assets/offers/offer_1.jpg',fit:BoxFit.fill,),
    ),
    OnBoardingContent(
      title: "Shop Everything You Love!",
      desc:
      "Discover top-quality products at the best prices with a seamless shopping experience",
      image: Image.asset(
        'assets/onboarding/onboarding_image_2.gif',
        fit: BoxFit.contain,
      ),
    ),
    OnBoardingContent(
      title: "Fast & Reliable Delivery!",
      desc:
      "Get your favorite items delivered to your doorstep, anytime, anywhere",
      image: Image.asset('assets/onboarding/onboarding_image_3.gif'),
    ),
  ];
  int currentIndex = 0;

  @override
  void dispose() {
    searchFocusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightTheme.secondaryBackgroundColor,
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
                                  style: LightTheme.categoryCardTitleStyle,
                                ),
                                Text(
                                  "Sanket Sawant",
                                  style: LightTheme.sectionTitle.copyWith(
                                    color: LightTheme.secondaryOnBackgroundColor,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "Popular Categories",
                                  style: LightTheme.sectionTitle.copyWith(
                                    color: LightTheme.secondaryOnBackgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                            width: double.infinity,
                            height: 85,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 20,left: index==0?10:0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          LightTheme.primaryBackgroundColor,
                                        ),
                                        child: Image.asset("assets/category_icons/sports.png"),
                                      ),
                                      Text(
                                        "Sports",
                                        style:
                                        LightTheme.categoryCardTitleStyle,
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
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: LightTheme.primaryBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: LightTheme.primaryOnBackgroundColor.withValues(alpha: 0.2),spreadRadius: 4,blurRadius: 5)]
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Image.asset("assets/common_icons/search.png"),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextField(
                            focusNode: searchFocusNode,
                            controller: searchController,
                            onTapOutside: (event){
                              searchFocusNode.unfocus();
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
      
                                hintText: "Search In Store",
                                hintStyle: LightTheme.textFieldHint.copyWith(color: LightTheme.descTextColor)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 170,
                  width: double.infinity,
                  child: CarouselSlider(
                    carouselController: carouselController,
                    items: contents.map((content) {
                      return Container(
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: content.image,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                MyButton.carouselNavigators(7, 100, currentIndex, contents.length),
                
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.68,
                        mainAxisSpacing:10 ,
                        crossAxisSpacing: 10,
                        maxCrossAxisExtent: 300
                    ),
                    itemBuilder: (context,index){
                      return Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: LightTheme.primaryCardBackgroundColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LayoutBuilder(
                                  builder: (context,constraints) {
                                    width=constraints.maxWidth;
                                    return Container(
                                      width: width,
                                      height: width,
                                      decoration: BoxDecoration(
                                        color: LightTheme.primaryBackgroundColor,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Image.asset("assets/product/iphone.png"),
                                    );
                                  }
                                ),
                                SizedBox(height: width*0.02),
                                Text("iPhone 11 64GB",style: LightTheme.cardProductNameStyle,),
                                Text("Apple",style: LightTheme.cardCompanyNameStyle,),
                                Spacer(),
                                Text("\$399",style: LightTheme.cardPriceStyle),
                              ],
                            ),
                          ),
                          Positioned(
                            right:0,
                            bottom:0,
                            child: GestureDetector(
                              child: Container(
                                width: width*0.075,
                                height: width*0.075,
                                decoration: BoxDecoration(
                                    color: LightTheme.primaryCardOnBackgroundColor,
                                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(16),topLeft: Radius.circular(10))
                                ),
                                child: Icon(Icons.add,color: LightTheme.primaryCardBackgroundColor,size: 23,),
                              ),
                            ),
                          ),
                          Positioned(
                              left:7+width*0.02,
                              top:7+width*0.02,
                              child: Container(
                                padding:EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                color: LightTheme.discountCardBackgroundColor,
                                borderRadius: BorderRadius.circular(6)
                            ),
                                child: Text("18%",style: LightTheme.cardDiscountStyle,),
                          )),
                          Positioned(
                              right:7+width*0.01,
                              top:7+width*0.01,
                              child: Container(
                                padding:EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: LightTheme.primaryCardBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.favorite_outline,size: 20,),
                              ))
                        ],
                      );
                    })
              ],
            ),
          )
      
        ],
      ),
    );
  }
}
