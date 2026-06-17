import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home_page/model/review_model.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class ReviewCard extends StatelessWidget{
  final Reviews review;
  const ReviewCard({super.key,required this.review});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.primaryCardBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: theme.primaryBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  review.reviewerName?[0]??"-",
                  style: theme.productStockStyle
                      .copyWith(fontSize: 16),
                ),
              ),
              SizedBox(width: 10),
              Text(
                review.reviewerName??"------",
                style: theme.cardProductNameStyle
                    .copyWith(fontSize: 15),
              ),
              Spacer(),
              Row(
                children: [
                  for (int i = 0; i < (review.rating??5); i++)
                    Icon(
                      Icons.star,
                      color: theme.starColor,
                      size: 16,
                    ),
                  for (int i = 0; i < 5-(review.rating??5); i++)
                    Icon(
                      Icons.star_border,
                      color: theme.starColor,
                      size: 16,
                    ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              review.comment??"Not Available",
              style: theme.cardCompanyNameStyle,
            ),
          ),
        ],
      ),
    );
  }
}