
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/global_navigator.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/authentication/screens/login_screen.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/profile/screens/address_list_screen.dart';
import '../../cart_and_order/screens/cart_screen.dart';
import '../../home_page/screens/home_screen.dart';
import '../../profile/screens/add_address_form_screen.dart';
import '../../wishlist/screens/wishlist_screen.dart';
import '../bloc/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenActiveState>(
      listener: (context,state)async{
        if(state.logoutState){
          log("in the main screen");
          log("navigator state: ${GlobalNavigator.navigatorKey.currentState}");
          // context.read<MainScreenBloc>().add(SetPageIndexEvent(index: 0));
          }
        },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: LightTheme.primaryBackgroundColor,
            // appBar: myAppBar(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                context.read<MainScreenBloc>().add(SetPageIndexEvent(index: index));
              },
              selectedItemColor: LightTheme.secondaryBackgroundColor,
              unselectedItemColor: LightTheme.primaryOnBackgroundColor,
              currentIndex: state.currentPageIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store_outlined),
                  label: "Store",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: "WishList",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
              ],
            ),
            body: switch(state.currentPageIndex){
              0 => HomeScreen(),
              1 => CartScreen(),
              2 => WishlistScreen(),
              3 => CartScreen(),
              _ => HomeScreen()
            }

        );
      },
    );
  }
}
