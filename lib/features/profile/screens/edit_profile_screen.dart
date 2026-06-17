import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/core/helpers/cached_network_image.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/helpers/profile_image_picker.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../helpers/update_data_bottom_sheet.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
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
                      CustomAppbar.featureAppbar(theme: theme, "Edit Profile", context: context,goBack: true),
                      SizedBox(height: 40,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                        child: Column(
                          spacing: 20,
                          children: [
                            InkWell(
                              onTap: ()async{
                                var _imagePicker =ImagePicker();
                                final XFile? image =await _imagePicker.pickImage(source: ImageSource.gallery);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                height: 125,
                                width: 125,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: theme.secondaryBackgroundColor, width: 5),
                                ),
                                  child:Stack(
                                    children: [
                                      state.isProfileLoading?SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator()):
                                          MyCachedNetworkImage(imageUrl: state.userData?.image??""),
                                      Positioned(
                                        right: 10,
                                          bottom: 5,
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: theme.secondaryBackgroundColor,
                                                shape: BoxShape.circle
                                              ),
                                              child: Icon(Icons.edit_outlined,color: theme.secondaryOnBackgroundColor,)))
                                    ],
                                  )
                              ),
                            ),
                            Divider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16,
                              children: [
                                Text("Account Settings",style: theme.pageTitle.copyWith(fontSize: 20)),
                                InkWell(
                                  onTap: (){
                                    updateNameDataBottomSheet(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Name",style: theme.profileLabelText,),
                                      Text("${state.userData?.firstName??'----'} ${state.userData?.lastName??'----'}",style: theme.profileValueText),
                                      Icon(Icons.chevron_right,size: 18,color: theme.primaryOnBackgroundColor,)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    updateUserName(context,oldValue:state.userData?.username??"");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Username",style: theme.profileLabelText,),
                                      Text(state.userData?.username??'----',style: theme.profileValueText),
                                      Icon(Icons.chevron_right,size: 18,color: theme.primaryOnBackgroundColor)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16,
                              children: [
                                Text("Profile Settings",style: theme.pageTitle.copyWith(fontSize: 20)),
                                InkWell(
                                  onTap: ()async{
                                    await Clipboard.setData(ClipboardData(text: "${state.userData?.id??''}"));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("User ID ",style: theme.profileLabelText,),
                                      Text("${state.userData?.id??'----'}",style: theme.profileValueText),
                                      Icon(Icons.copy_outlined,size: 18,color: theme.primaryOnBackgroundColor)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    updateEmail(context,oldValue:state.userData?.email??"");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Email",style: theme.profileLabelText,),
                                      Text(state.userData?.email??'----',style: theme.profileValueText),
                                      Icon(Icons.chevron_right,size: 18,color: theme.primaryOnBackgroundColor)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    updatePhoneNumber(context,oldValue:"9123567473");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Phone Number",style: theme.profileLabelText,),
                                      Text("9123567473",style: theme.profileValueText),
                                      Icon(Icons.chevron_right,size: 18,color: theme.primaryOnBackgroundColor)
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Gender",style: theme.profileLabelText,),
                                    Text(state.userData?.gender??'----',style: theme.profileValueText),
                                    Icon(Icons.chevron_right,size: 18,color: theme.primaryOnBackgroundColor)
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            // InkWell(child: Text("Close Account",style: theme.textStyle.copyWith(color: theme.errorTextColor,fontSize: 17,fontWeight: FontWeight(600)),))
                  
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                    left:0,
                    right: 0,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                      child: MyButton.primaryButton(theme: theme, text: "Save", onTap: (){}),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
