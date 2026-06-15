import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar.featureAppbar("Order Details", context: context),

        ],
      ),
    );
  }
}
