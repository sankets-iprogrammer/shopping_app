import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/app_theme.dart';


class MyButton {
  static Widget primaryButton({
    Widget? widget,
    bool loading = false,
    String text ="",
    double width = double.infinity,
    required Function onTap,
    double verticalPadding= 12,
    required AppTheme theme,
  }) {
    return GestureDetector(
      onTap: () {
      onTap();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.secondaryBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: theme.secondaryOnBackgroundColor,
                ),
              )
            : widget?? SizedBox(
                height: 25,
                child: Text(
                  text,
                  style: theme.textStyle.copyWith(
                    color: theme.secondaryOnBackgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
      ),
    );
  }

  static Widget secondaryButton({
    bool loading = false,
    required String text,
    double width = double.infinity,
    required Function onTap,
    double verticalPadding =12,
    required AppTheme theme,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryOnBackgroundColor),
        ),
        child: loading
            ? SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            color: theme.primaryOnBackgroundColor,
          ),
        )
            : SizedBox(
          height: 25,
          child: Text(
            text,
            style: theme.textStyle.copyWith(
              color: theme.primaryOnBackgroundColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  static Widget carouselNavigators({
    required double height,
    required double width,
    required int activeIndex,
    required int count,
      required AppTheme theme}
  ) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        spacing: 10,
        children: [
          for (int i = 0; i < count; i++)
            Expanded(
              flex: i == activeIndex ? 2 : 1,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                decoration: BoxDecoration(
                  color: i == activeIndex
                      ? theme.secondaryBackgroundColor
                      : theme.disabledBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
