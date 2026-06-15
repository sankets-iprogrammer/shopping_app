import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/features/cart_and_order/screens/cart_screen.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/screens/address_list_screen.dart';
import 'package:shopping_app/features/profile/screens/edit_profile_screen.dart';
import 'package:shopping_app/features/profile/widgets/setting_option_card.dart';

import '../../../core/helpers/common_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context,state){
        if(state.addressEditingStatus==EditingStatus.editing){

        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomAppbar.featureAppbar("My Profile", context: context),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
              child: Column(
                spacing: 30,
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      height: 125,
                      width: 125,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: LightTheme.secondaryBackgroundColor, width: 5),
                      ),
                      child: state.isProfileLoading?CircularProgressIndicator():
                      Image.network(state.userData?.image??"",fit: BoxFit.fill,)
                    //Image.network(state.userData?.image??"",fit: BoxFit.fill,),
                  ),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Unknown Pro",style: LightTheme.sectionTitle,),
                          Text("unknownpro@gmail.com",style: LightTheme.productDesc)
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                        },
                          child: Icon(Icons.edit_outlined,size: 25,))
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
                    children: [
                      Text("Account Settings",style: LightTheme.pageTitle.copyWith(fontSize: 20)),
                      SettingOptionCard(iconsData: Icons.house_outlined,tittle: "My Addresses",description: "Set shopping delivery addresses",
                        onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressListScreen()));
                      },),
                      SettingOptionCard(iconsData: Icons.shopping_cart_outlined,tittle: "My Cart",description: "Add, remove products and move to checkout",
                        onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                        },
                      ),
                      SettingOptionCard(iconsData: Icons.receipt_outlined,tittle: "My Orders",description: "Set shopping delivery addresses",
                      onTap: (){
                      },
                      ),
                      SettingOptionCard(iconsData: Icons.dark_mode_outlined,tittle: "Themes",description: "Set shopping delivery addresses",
                        onTap: (){
                        },
                      ),
                    ],
                  ),

                  MyButton.secondaryButton(text: "Logout", onTap: (){
                    CommonFunctions.logout();
                  })
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
