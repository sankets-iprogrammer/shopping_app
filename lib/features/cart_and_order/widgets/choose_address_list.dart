import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_bloc.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_event.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_state.dart';
import 'package:shopping_app/features/cart_and_order/widgets/address_card.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';
import 'package:shopping_app/features/profile/screens/add_address_form_screen.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/widgets/buttons.dart';
import '../../profile/bloc/profile_events.dart';

class ChooseAddressList extends StatelessWidget {
  const ChooseAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return BlocBuilder<CartBloc,CartState>(
      builder: (context,state) {
        List<AddressModel> addresses =context.watch<ProfileBloc>().state.addresses;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select address",style: theme.pageTitle,),
                SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: addresses.length,
                    itemBuilder: (context,index){
                    AddressModel address =addresses[index];
                    return InkWell(
                      onTap: (){
                        context.read<CartBloc>().add(SetSelectedAddressEvent(selectedAddress: address));
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: AddressCard(address: address,isSelected: state.selectedAddress?.id==address.id,readOnly: true,),
                      ),
                    );
                }),
                SizedBox(height: 20,),
                MyButton.primaryButton(
                    theme: theme,
                    text: "Add Address", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressFormScreen(newAddress: true,)));
                }),
              ],
            ),
          ),
        );
      }
    );
  }
}
