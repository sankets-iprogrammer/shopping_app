import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/features/cart_and_order/widgets/address_card.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_events.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/screens/add_address_form_screen.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../helpers/editing_status_enum.dart';
import '../models/address_model.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return BlocConsumer<ProfileBloc,ProfileState>(
      listener: (context,state){
        if(state.addressEditingStatus==EditingStatus.editing){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressFormScreen()));
        }
      },
      builder: (context,state) {
        return Scaffold(
          backgroundColor: theme.primaryBackgroundColor,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomAppbar.featureAppbar(theme: theme, "Addresses",context: context,goBack: true),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                        child:
                        state.addresses.isEmpty?
                            Column(
                              children: [
                                SizedBox(height: 40,),
                                Center(child: Lottie.asset('assets/animations/empty.json',height: 350,)),
                                Text("No addresses added yet.",
                                  style: theme.pageTitle,
                                ),
                                SizedBox(height: 10,),
                                Text("Add a new address to make checkout faster and easier.",style: theme.productDesc,textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                              ],
                            ):
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
                            }),
                      ),
                      SizedBox(height: 60,)
                    ]
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                      child: MyButton.primaryButton(
                        theme: theme,
                          text: "Add Address", onTap: () {
                            context.read<ProfileBloc>().add(OpenAddressEditingScreenEvent(address: null));
                      }),
                    ))
              ],
            ),
          ),
        );
      }
    );
  }
}
