import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/features/cart_and_order/widgets/address_card.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../models/address_model.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ProfileState>(
      builder: (context,state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  CustomAppbar.featureAppbar("Addresses",context: context,goBack: true),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.addresses.length,
                            itemBuilder: (context,index){
                              AddressModel address=state.addresses[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom:20),
                                child: AddressCard(address: address),
                              );
                            })
                      ],
                    ),
                  )

                ]

              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
                    child: MyButton.primaryButton(
                        text: "Add Address", onTap: () {}),
                  ))
            ],
          ),
        );
      }
    );
  }
}
