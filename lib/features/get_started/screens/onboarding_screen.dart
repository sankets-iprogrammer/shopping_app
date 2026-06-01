import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../main_screen/screens/main_screen.dart';
import '../model/on_boarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void handleNext(){
    if(currentIndex<contents.length-1){
      setState(() {
        carouselController.nextPage();
      });
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
    }
  }

  CarouselSliderController carouselController=CarouselSliderController();
  List<OnBoardingContent> contents = [
    OnBoardingContent(
      title: "Welcome to UP Store",
      desc: "Your one-stop destination for effortless and enjoyable shopping",
      image: Image.asset('assets/onboarding/onboarding_image_1.gif'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: LightTheme.pageHorizontalMargin,
            vertical: LightTheme.pageVerticalMargin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Skip",
                    style: LightTheme.textStyle.copyWith(
                      color: LightTheme.navigationTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              // Spacer(),
              SizedBox(
                // height: 300,
                // width: 400,
                child: CarouselSlider(
                  carouselController: carouselController,
                  items: contents.map((content) {
                    return content.image;
                  }).toList(),
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 400,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
        
              Text(
                contents[currentIndex].title,
                style: LightTheme.textStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                contents[currentIndex].desc,
                style: LightTheme.textStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40,),
              MyButton.carouselNavigators(6, 140, currentIndex, 3),
              Spacer(),
              MyButton.primaryButton(text: currentIndex==contents.length-1?"Continue": "Next",onTap:handleNext),
            ],
          ),
        ),
      ),
    );
  }
}
