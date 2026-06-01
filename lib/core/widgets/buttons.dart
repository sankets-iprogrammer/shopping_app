import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/themes/theme_manager.dart';

class MyButton {
  static Widget primaryButton({
    bool loading = false,
    required String text,
    double width = double.infinity,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: LightTheme.secondaryBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: LightTheme.secondaryOnBackgroundColor,
                ),
              )
            : SizedBox(
                height: 25,
                child: Text(
                  text,
                  style: LightTheme.textStyle.copyWith(
                    color: LightTheme.secondaryOnBackgroundColor,
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
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: LightTheme.primaryOnBackgroundColor),
        ),
        child: loading
            ? SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            color: LightTheme.primaryOnBackgroundColor,
          ),
        )
            : SizedBox(
          height: 25,
          child: Text(
            text,
            style: LightTheme.textStyle.copyWith(
              color: LightTheme.primaryOnBackgroundColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  static Widget carouselNavigators(
    double height,
    double width,
    int activeIndex,
    int count,
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
                      ? LightTheme.secondaryBackgroundColor
                      : LightTheme.disabledBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
