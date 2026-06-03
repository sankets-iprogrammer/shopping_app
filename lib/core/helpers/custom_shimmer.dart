


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/core/themes/light_theme.dart';

class CustomShimmer {
  static Widget getShimmerContainer({
    required double height,
    required double width,
    required Color baseColor,
    required Color highlightColor,
    BoxShape shape = BoxShape.rectangle,
    double? borderRadius,
  }) {
    return Shimmer.fromColors(
      period: Duration(seconds: 2),
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius??0)
              : null,
          shape: shape,
          color: baseColor,
        ),

      ),
    );
  }

  static Widget getShimmerProductCard(){
    return LayoutBuilder(builder: (context,constraints){
      double width =constraints.maxWidth;
      return Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: LightTheme.primaryCardBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
            children: [
              getShimmerContainer(
                  height: width,
                  width: width,
                  baseColor: LightTheme.primaryBackgroundColor,
                  highlightColor: LightTheme.primaryCardBackgroundColor,
                  borderRadius: 10
              ),
              getShimmerContainer(
                  height: 15,
                  width: width*0.8,
                  baseColor: LightTheme.primaryBackgroundColor,
                  highlightColor: LightTheme.primaryCardBackgroundColor,
                  borderRadius: 7
              ),
              Row(
                spacing: width*0.1,
                children: [
                  getShimmerContainer(
                      height: 15,
                      width: width*0.5,
                      baseColor: LightTheme.primaryBackgroundColor,
                      highlightColor: LightTheme.primaryCardBackgroundColor,
                      borderRadius: 7
                  ),
                  getShimmerContainer(
                      height: 15,
                      width: width*0.3,
                      baseColor: LightTheme.primaryBackgroundColor,
                      highlightColor: LightTheme.primaryCardBackgroundColor,
                      borderRadius: 7
                  ),
                ],
              )

            ],
        ),
      );
    });
  }
}