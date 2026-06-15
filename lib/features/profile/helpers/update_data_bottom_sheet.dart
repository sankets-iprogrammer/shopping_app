

import 'package:flutter/material.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';

import '../../../core/validator.dart';



void updateNameDataBottomSheet(BuildContext context){
  showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
      context: context,
      builder: (context){
    TextEditingController _firstNameController =TextEditingController();
    TextEditingController _lastNameController =TextEditingController();
    return Padding(
      padding: EdgeInsets.only(top: 30,left: 20,right: 20,bottom: MediaQuery.of(context).viewInsets.bottom+20,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Change Name",style: LightTheme.pageTitle,),
          Text("Update your name to keep your profile accurate and personalized"),
          SizedBox(height: 30,),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: TextFormField(
                  maxLength: 10,
                  controller:_firstNameController,
                  decoration: LightTheme.textFieldDecoration(label: "First Name", hintText:"First Name",iconData:Icons.person_3_outlined),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "This field is mandatory!";
                    }
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  maxLength: 10,
                  controller:_lastNameController,
                  decoration: LightTheme.textFieldDecoration(label: "Last Name", hintText:"Last Name",iconData:Icons.person_3_outlined),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "This field is mandatory!";
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          MyButton.primaryButton(text: "Save", onTap: (){
          })
        ],
      ),
    );
  });
}

void updateUserName(BuildContext context,{required String oldValue}){
  String? userNameValidator(value){
    if(value?.trim().isEmpty??true){
      return "This field is mandatory!";
    }else{
      return null;
    }
  }
  updateTextFieldDataBottomSheet(
    context,
    title: "change Username",
    desc: "Update your username to make your profile unique and easily identifiable.",
    label: "Username",
    hintText: "Username",
    oldValue:oldValue,
    iconData: Icons.person_3_outlined,
    validator: userNameValidator
  );
}
void updateEmail(BuildContext context,{required String oldValue}){
  String? emailValidator(value){
    if(value==null || value.trim().isEmpty){
      return "This field is mandatory";
    }else if(!isValidEmail(value.trim())){
      return "Invalid email format";     //for testing it is commited
    }else{
      return null;
    }
  }
  updateTextFieldDataBottomSheet(
      context,
      title: "Change Email",
      desc: "Update your email address to keep your account secure and receive important notifications",
      label: "Email",
      hintText: "Email",
      oldValue:oldValue,
      iconData: Icons.email_outlined,
      validator: emailValidator
  );
}
void updatePhoneNumber(BuildContext context,{required String oldValue}){
  String? phoneNumberValidator(String? value){
    if(value?.trim().isEmpty??true){
      return "This field is mandatory!";
    }else if(int.tryParse(value??"")==null && value?.length!=10){
      return "Invalid phone number";
    }else{
      return null;
    }
  }
  updateTextFieldDataBottomSheet(
      context,
      title: "Change Phone Number",
      desc: "Update your phone number to stay connected and help keep your account secure.",
      label: "Phone Number",
      hintText: "Phone Number",
      oldValue:oldValue,
      iconData: Icons.call_outlined,
      validator: phoneNumberValidator
  );
}

void updateTextFieldDataBottomSheet(
    BuildContext context,
    {required String title,
      required String desc,
      required String label,
      required String hintText,
      required String oldValue,
      required IconData iconData,
      required String? Function(String?) validator,
    }){
  showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context){
        TextEditingController _textFieldController =TextEditingController();
        _textFieldController.text=oldValue;
        return Padding(
          padding: EdgeInsets.only(top: 30,left: 20,right: 20,bottom: MediaQuery.of(context).viewInsets.bottom+20,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: LightTheme.pageTitle,),
              Text(desc),
              SizedBox(height: 30,),
                  TextFormField(
                    maxLength: 10,
                    controller:_textFieldController,
                    decoration: LightTheme.textFieldDecoration(label: label, hintText:hintText,iconData:iconData),
                    validator: (value){
                     return validator(value);
                    }
                  ),
              SizedBox(height: 20,),
              MyButton.primaryButton(text: "Save", onTap: (){
              })
            ],
          ),
        );
      });
}