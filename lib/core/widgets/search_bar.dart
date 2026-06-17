import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/app_theme.dart';

import '../themes/theme_bloc/theme_bloc.dart';

class MySearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Function onClear;
  final TextEditingController controller;
  const MySearchBar({super.key,required this.onChanged,required this.onSubmitted,required this.onClear,required this.controller});

  @override
  Widget build(BuildContext context) {
    FocusNode searchFocusNode =FocusNode();
    AppTheme theme = context.watch<ThemeBloc>().state.currentTheme;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: theme.pageHorizontalMargin,
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: theme.primaryOnBackgroundColor
                .withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          Image.asset("assets/common_icons/search.png"),
          SizedBox(width: 15),
          Expanded(
            child: TextField(
              style: theme.cardProductNameStyle,
              focusNode: searchFocusNode, //searchFocusNode,
              controller: controller,
              onTapOutside: (event) {
                searchFocusNode.unfocus();
              },
              onChanged:onChanged,
              onSubmitted:onSubmitted,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search in store",
                hintStyle: theme.textFieldHint.copyWith(
                  color: theme.descTextColor,
                ),
              ),
            ),
          ),
          controller.text.isNotEmpty?
          InkWell(
            onTap: (){
                  onClear();
            },
            child: Icon(Icons.clear),
          ):
          SizedBox(),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
