import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_app/core/helpers/custom_snackbar.dart';
import 'package:shopping_app/core/helpers/overlay_widgets.dart';
import 'package:shopping_app/core/helpers/u_uid_generator.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';
import 'package:shopping_app/features/profile/bloc/profile_events.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../bloc/profile_bloc.dart';

class AddAddressFormScreen extends StatefulWidget {
  final bool newAddress;
  const AddAddressFormScreen({super.key,this.newAddress=false});


  @override
  State<AddAddressFormScreen> createState() => _AddAddressFormScreenState();
}

class _AddAddressFormScreenState extends State<AddAddressFormScreen> {
  GlobalKey<FormState> _loginFormKey =GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController streetController=TextEditingController();
  TextEditingController postalCodeController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  AddressModel? address;
  @override
  void initState() {
    if(!widget.newAddress){
      address= context.read<ProfileBloc>().state.currentEditingAddress;
      nameController.text=address?.name??"";
      numberController.text=address?.number.toString()??"";
      streetController.text=address?.street??"";
      postalCodeController.text=address?.postalCode.toString()??"";
      cityController.text=address?.city??"";
      stateController.text=address?.state??"";
      countryController.text=address?.country??"";
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Scaffold(
      backgroundColor: theme.primaryBackgroundColor,
      body: BlocListener<ProfileBloc,ProfileState>(
        listener: (context,state)async{
          if(state.addressEditingStatus==EditingStatus.success){
            await showOverlayAnimation(context,assetsAddress: "assets/animations/success.json",duration: Duration(seconds: 2));
            Navigator.pop(context);
          }else if(state.addressEditingStatus==EditingStatus.error){
            CustomSnackBar.showErrorSnackBar(context, "Failed to save address");
          }
        },
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomAppbar.featureAppbar(theme: theme, address==null?"Add Address":"Edit Address", context: context,goBack: true),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin,vertical: 10),
                        child: Form(
                          key :_loginFormKey,
                          child: Column(
                            spacing: 20,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                  child: Image.asset("assets/common_icons/location_image.png",fit: BoxFit.fill,)),
                              Text("Add your delivery address to ensure your orders reach the right location. You can update or manage your saved addresses anytime.",style: theme.productDesc,),
                              TextFormField(
                                maxLength: 30,
                                style: theme.cardPriceStyle,
                                controller:nameController,
                                decoration: theme.textFieldDecoration(label: "Name", hintText:"Name eg. Home, Work, etc...",iconData:Icons.home_outlined),
                                validator: (value){
                                  if(value?.trim().isEmpty??true){
                                    return "This field is mandatory!";
                                  }
                                },
                              ),
                              TextFormField(
                                maxLength: 10,
                                controller:numberController,
                                decoration: theme.textFieldDecoration(label: "Mobile Number", hintText:"Mobile Number",iconData:Icons.call_outlined),
                                validator: (value){
                                  if(value?.trim().isEmpty??true){
                                    return "This field is mandatory!";
                                  }
                                },
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      maxLength: 30,
                                      controller:streetController,
                                      decoration: theme.textFieldDecoration(label: "House & Street", hintText:"House & Street",iconData:Icons.house_outlined),
                                      validator: (value){
                                        if(value?.trim().isEmpty??true){
                                          return "This field is mandatory!";
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      maxLength: 30,
                                      controller:postalCodeController,
                                      decoration: theme.textFieldDecoration(label: "Postal Code", hintText:"Postal Code",iconData:Icons.local_post_office_outlined),
                                      validator: (value){
                                        if(value?.trim().isEmpty??true){
                                          return "This field is mandatory!";
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      maxLength: 30,
                                      controller:cityController,
                                      decoration: theme.textFieldDecoration(label: "City", hintText:"City",iconData:Icons.location_city_outlined),
                                      validator: (value){
                                        if(value?.trim().isEmpty??true){
                                          return "This field is mandatory!";
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      maxLength: 30,
                                      controller:stateController,
                                      decoration: theme.textFieldDecoration(label: "State", hintText:"State",iconData:Icons.network_cell_outlined),
                                      validator: (value){
                                        if(value?.trim().isEmpty??true){
                                          return "This field is mandatory!";
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                maxLength: 30,
                                controller:countryController,
                                decoration: theme.textFieldDecoration(label: "Country", hintText:"Country",iconData:Icons.network_cell_outlined),
                                validator: (value){
                                  if(value?.trim().isEmpty??true){
                                    return "This field is mandatory!";
                                  }
                                },
                              ),
                              SizedBox(height: 100,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                    right: 0,
                    bottom: 20,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
                      child: MyButton.primaryButton(theme: theme, text: "Save", onTap: ()async{
                        if(_loginFormKey.currentState!.validate()){
                          AddressModel savedAddress =AddressModel(
                              id: address?.id?? UUidGenerator.getUniqueKey(),
                              name: nameController.text,
                              number: int.parse(numberController.text),
                              street: streetController.text,
                              postalCode: int.parse(postalCodeController.text),
                              city: cityController.text,
                              state: stateController.text,
                              country: countryController.text
                          );
                          context.read<ProfileBloc>().add(SaveAddressEvent(address: savedAddress));
                        }
                      }
                      ),
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}
