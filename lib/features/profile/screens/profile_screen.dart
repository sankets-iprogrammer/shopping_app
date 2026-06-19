import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/cached_network_image.dart';
import 'package:shopping_app/core/helpers/custom_dialog.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/features/cart_and_order/screens/cart_screen.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/screens/address_list_screen.dart';
import 'package:shopping_app/features/profile/screens/edit_profile_screen.dart';
import 'package:shopping_app/features/profile/screens/order_list_screen.dart';
import 'package:shopping_app/features/profile/widgets/select_theme.dart';
import 'package:shopping_app/features/profile/widgets/setting_option_card.dart';

import '../../../core/helpers/common_functions.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.watch<ThemeBloc>().state.currentTheme;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar.featureAppbar("My Profile",theme: theme, context: context),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
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
                              color: theme.secondaryBackgroundColor, width: 5),
                        ),
                        child: state.isProfileLoading?CircularProgressIndicator():
                            MyCachedNetworkImage(imageUrl: state.userData?.image??""),
                    ),
          
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Unknown Pro",style: theme.sectionTitle,),
                            Text("unknownpro@gmail.com",style: theme.productDesc)
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                          },
                            child: Icon(Icons.edit_outlined,size: 25,color: theme.primaryOnBackgroundColor,))
                      ],
                    ),
          
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 30,
                      children: [
                        Text("Account Settings",style: theme.pageTitle.copyWith(fontSize: 20)),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListScreen()));
                        },
                        ),
                        SettingOptionCard(iconsData: Icons.dark_mode_outlined,tittle: "Themes",description: "Set shopping delivery addresses",
                          onTap: (){
                            showModalBottomSheet(
                              backgroundColor: theme.primaryBackgroundColor,
                                context: context,
                                builder: (context){
                                  return SelectTheme();
                                });
                          },
                        ),
                      ],
                    ),
                    MyButton.secondaryButton(theme: theme, text: "Logout", onTap: ()async{
                      if(await CustomDialog.showConfirmationDialog(
                        context,message: "Are you sure you want to log out?",
                        cancelEnabled: true
                      )){
                        context.read<MainScreenBloc>().add(SetPageIndexEvent(index: 0));
                        CommonFunctions.logout();
                      }
          
                    })
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
