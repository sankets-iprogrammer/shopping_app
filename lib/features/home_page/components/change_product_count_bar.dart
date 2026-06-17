import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../cart_and_order/bloc/cart_bloc.dart';
import '../../cart_and_order/bloc/cart_event.dart';
class ChangeProductCountBar extends StatelessWidget {
  const ChangeProductCountBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme=context.watch<ThemeBloc>().state.currentTheme;
    return  BlocBuilder<HomeBloc,HomeState>(
      builder: (context,state) {
        return Row(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context.read<CartBloc>().add(
                  ChangeProductCartCountEvent(
                    id: state.currentProduct!.id,
                    desc: true,
                  ),
                );
              },
              child: Icon(
                Icons.remove,
                color: theme
                    .secondaryOnBackgroundColor,
                size: 23,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Text(
                context.read<CartBloc>().state.productCartCount[state.currentProduct!.id].toString(),
                style: TextStyle(
                  color: theme.secondaryOnBackgroundColor,
                  fontWeight: FontWeight(
                    800,
                  ),
                  fontSize: 17
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.read<CartBloc>().add(
                  ChangeProductCartCountEvent(
                    id:state.currentProduct!.id,
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: theme
                    .secondaryOnBackgroundColor,
                size: 23,
              ),
            ),
          ],
        );
      }
    );
  }
}
