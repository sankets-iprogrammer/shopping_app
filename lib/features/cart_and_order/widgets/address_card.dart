import 'package:flutter/material.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

import '../../../core/themes/light_theme.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isPrimary;
  final bool isSelected;
  const AddressCard({
    super.key,
    required this.address,
    this.isPrimary=false,
    this.isSelected=false
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:isSelected?Border.all(color: LightTheme.secondaryBackgroundColor,width: 2):  Border.all(color: LightTheme.specBorderColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 7,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.name, style: LightTheme.cartPriceText.copyWith(
                  fontWeight: FontWeight(600)),),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.call_outlined, size: 18,),
                  Text("+${address.number}", style: LightTheme.cartPriceText,)
                ],
              ),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.person_3_outlined, size: 18,),
                  Text("${address.street}, ${address.city}, ${address.state}, ${address.country}",
                    style: LightTheme.cartPriceText,)
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isPrimary? Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text("primary",style: LightTheme.textStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight(600),
                    fontSize: 12
                ),),
              ):SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
