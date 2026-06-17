import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/custom_dialog.dart';
import 'package:shopping_app/features/profile/bloc/profile_events.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../profile/bloc/profile_bloc.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isPrimary;
  final bool isSelected;
  final bool readOnly;
  const AddressCard({
    super.key,
    required this.address,
    this.isPrimary=false,
    this.isSelected=false,
    this.readOnly=false
  });
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected?theme.secondaryBackgroundColor.withAlpha(20):Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border:isSelected?Border.all(color: theme.secondaryBackgroundColor,width: 1):  Border.all(color: theme.specBorderColor.withAlpha(50))
      ),
      child: Column(
        spacing: 7,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(address.name, style: theme.cartPriceText.copyWith(
                  fontWeight: FontWeight(600)),),
              isPrimary? Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text("primary",style: theme.textStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight(600),
                    fontSize: 12
                ),),
              ):SizedBox(),
            ],
          ),
          Row(
            spacing: 5,
            children: [
              Icon(Icons.call_outlined, size: 18,color: theme.primaryOnBackgroundColor,),
              Text("+${address.number}", style: theme.cartPriceText,)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Icon(Icons.house_outlined, size: 18,color: theme.primaryOnBackgroundColor,),
              Expanded(
                child: Text("${address.street}, ${address.city}, ${address.state}, ${address.country}",
                  style: theme.cartPriceText,softWrap: true,),
              )
            ],
          ),
          readOnly?SizedBox():
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 20,
            children: [
              InkWell(
                onTap: (){
                  context.read<ProfileBloc>().add(OpenAddressEditingScreenEvent(address: address));
                },
                  child: Icon(Icons.edit,size: 20,color: theme.primaryOnBackgroundColor)),
              InkWell(
                onTap: ()async{
                  bool answer= await CustomDialog.showConfirmationDialog(context, message: "Are you sure you want to delete this address?",);
                  log("delete : $answer");
                  if(answer){
                    context.read<ProfileBloc>().add(DeleteAddressEvent(addressId: address.id));
                  }
                },
                  child: Icon(Icons.delete,size: 20,color: theme.primaryOnBackgroundColor)),
            ],
          )
        ],
      ),
    );
  }
}
