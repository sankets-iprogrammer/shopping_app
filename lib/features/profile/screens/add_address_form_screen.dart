import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/core/widgets/custom_appbar.dart';

import '../../../core/themes/light_theme.dart';

class AddAddressFormScreen extends StatelessWidget {
  const AddAddressFormScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController=TextEditingController();
    TextEditingController _numberController=TextEditingController();
    TextEditingController _streetController=TextEditingController();
    TextEditingController _postalCodeController=TextEditingController();
    TextEditingController _cityController=TextEditingController();
    TextEditingController _stateController=TextEditingController();
    TextEditingController _countryController=TextEditingController();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar.featureAppbar("Add Address", context: context,goBack: true),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin,vertical: 40),
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        maxLength: 30,
                        controller:_nameController,
                        decoration: LightTheme.textFieldDecoration(label: "Name", hintText:"Name eg. Home, Work, etc...",iconData:Icons.home_outlined),
                        validator: (value){
                          if(value?.trim().isEmpty??true){
                            return "This field is mandatory!";
                          }
                        },
                      ),
                      TextFormField(
                        maxLength: 10,
                        controller:_numberController,
                        decoration: LightTheme.textFieldDecoration(label: "Mobile Number", hintText:"Mobile Number",iconData:Icons.call_outlined),
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
                              controller:_streetController,
                              decoration: LightTheme.textFieldDecoration(label: "House & Street", hintText:"House & Street",iconData:Icons.house_outlined),
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
                              controller:_postalCodeController,
                              decoration: LightTheme.textFieldDecoration(label: "Postal Code", hintText:"Postal Code",iconData:Icons.local_post_office_outlined),
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
                              controller:_cityController,
                              decoration: LightTheme.textFieldDecoration(label: "City", hintText:"City",iconData:Icons.location_city_outlined),
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
                              controller:_stateController,
                              decoration: LightTheme.textFieldDecoration(label: "State", hintText:"State",iconData:Icons.network_cell_outlined),
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
                        controller:_countryController,
                        decoration: LightTheme.textFieldDecoration(label: "Country", hintText:"Country",iconData:Icons.network_cell_outlined),
                        validator: (value){
                          if(value?.trim().isEmpty??true){
                            return "This field is mandatory!";
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
                child: MyButton.primaryButton(text: "Save", onTap: (){}),
              ))
        ],
      ),
    );
  }
}
