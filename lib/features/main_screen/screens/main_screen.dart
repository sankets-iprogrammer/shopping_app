
import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import '../../home_page/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: LightTheme.secondaryBackgroundColor,
        unselectedItemColor: LightTheme.primaryOnBackgroundColor,
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
      body: HomeScreen()
    );
  }
}
