import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/custom_dialog.dart';
import 'package:shopping_app/core/helpers/global_navigator.dart';
import 'package:shopping_app/features/authentication/screens/login_screen.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/profile/bloc/profile_events.dart';
import 'package:shopping_app/features/profile/screens/address_list_screen.dart';
import 'package:shopping_app/features/store/bloc/store_event.dart';
import 'package:sqflite/sqflite.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../cart_and_order/bloc/cart_bloc.dart';
import '../../cart_and_order/screens/cart_screen.dart';
import '../../home_page/bloc/home_bloc.dart';
import '../../home_page/bloc/home_event.dart';
import '../../home_page/screens/home_screen.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../../profile/screens/add_address_form_screen.dart';
import '../../profile/screens/edit_profile_screen.dart';
import '../../profile/screens/order_details_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../store/bloc/store_bloc.dart';
import '../../store/bloc/store_state.dart';
import '../../store/screens/store_screen.dart';
import '../../wishlist/screens/wishlist_screen.dart';
import '../bloc/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserProfileDataEvent());
    context.read<HomeBloc>().add(LoadProductListEvent(firstTime: true));
    context.read<StoreBloc>().add(GetCategoriesEvent());
    context.read<HomeBloc>().add(LoadUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch<ThemeBloc>().state.currentTheme;
    return MultiBlocListener(
      listeners: [
        BlocListener<MainScreenBloc, MainScreenActiveState>(
          listener: (context, state) {
            if (state.logoutState) {
              log("in the main screen");
              log(
                "navigator state: ${GlobalNavigator.navigatorKey.currentState}",
              );
            }
          },
        ),
        BlocListener<StoreBloc, StoreState>(
          listener: (context, state) {
            if (state.currentCategory == null && state.categories.isNotEmpty) {
              log("assigning initial store value ${state.categories[0]}");
              context.read<StoreBloc>().add(
                GetCategoryProductsEvent(category: state.categories[0]),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<MainScreenBloc, MainScreenActiveState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (state.currentPageIndex != 0) {
                context.read<MainScreenBloc>().add(SetPageIndexEvent(index: 0));
              } else {
                if (await CustomDialog.showConfirmationDialog(
                  context,
                  message: "Are you sure you want to exit?",
                )) {
                  SystemNavigator.pop();
                }
              }
            },
            child: Scaffold(
              backgroundColor: theme.primaryBackgroundColor,
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (index) {
                  print("index");
                  context.read<MainScreenBloc>().add(
                    SetPageIndexEvent(index: index),
                  );
                },
                selectedIndex: state.currentPageIndex,
                destinations: [
                  NavigationDestination(
                    icon: Icon(
                      Icons.home_outlined,
                      color: state.currentPageIndex == 0
                          ? theme.secondaryOnBackgroundColor
                          : theme.primaryOnBackgroundColor,
                    ),
                    label: "home",
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.store_outlined,
                      color: state.currentPageIndex == 1
                          ? theme.secondaryOnBackgroundColor
                          : theme.primaryOnBackgroundColor,
                    ),
                    label: "store",
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: state.currentPageIndex == 2
                          ? theme.secondaryOnBackgroundColor
                          : theme.primaryOnBackgroundColor,
                    ),
                    label: "wishlist",
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.person_3_outlined,
                      color: state.currentPageIndex == 3
                          ? theme.secondaryOnBackgroundColor
                          : theme.primaryOnBackgroundColor,
                    ),
                    label: "profile",
                  ),
                ],
                labelTextStyle: WidgetStatePropertyAll(
                  theme.cardProductNameStyle,
                ),
                backgroundColor: theme.primaryBackgroundColor,
                indicatorColor: theme.secondaryBackgroundColor,
              ),
              body: SizedBox(
                width: MediaQuery.widthOf(context),
                height: MediaQuery.heightOf(context),
                child: Stack(
                  children: [
                    switch (state.currentPageIndex) {
                      0 => HomeScreen(),
                      1 => StoreScreen(),
                      2 => WishlistScreen(),
                      3 => ProfileScreen(),
                      _ => HomeScreen(),
                    },
                    state.currentPageIndex == 3 ||
                            context
                                .watch<CartBloc>()
                                .state
                                .productCartCount
                                .isEmpty
                        ? SizedBox()
                        : Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: theme.secondaryBackgroundColor,
                                ),
                                child: Badge(
                                  label: Text(
                                    context
                                        .watch<CartBloc>()
                                        .state
                                        .productCartCount
                                        .values
                                        .reduce(
                                          (int sum, int value) => sum + value,
                                        )
                                        .toString(),
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 35,
                                    color: theme.secondaryOnBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
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
