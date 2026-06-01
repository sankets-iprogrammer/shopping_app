import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/light_theme.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let’s Get You Registered",style: LightTheme.pageTitle,),
            SizedBox(height: 10,),
            Text("Register to Access Exclusive Deals and Simplify Your Shopping Experience",style: LightTheme.pageDesc,),
            SizedBox(height: 24,),
            Form(child: Column(
              children: [
                Column(
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: TextFormField(
                              decoration: LightTheme.textFieldDecoration(label: "First Name", hintText:"First Name",iconData:Icons.person_outline)
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                              decoration: LightTheme.textFieldDecoration(label: "Last Name",hintText:"Last Name",iconData:Icons.person_outline)
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                        decoration: LightTheme.textFieldDecoration(label: "Email",hintText:"Email",iconData:Icons.email_outlined)
                    ),

                    TextFormField(
                        decoration: LightTheme.textFieldDecoration(label: "Phone Number",hintText:"Phone Number",iconData:Icons.call_outlined)
                    ),

                    TextFormField(
                        decoration: LightTheme.textFieldDecoration(label: "Password",hintText:"Password",iconData:Icons.password_outlined,suffixIcon: Icons.visibility_outlined)
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: LightTheme.secondaryOnBackgroundColor,
                        fillColor:WidgetStatePropertyAll(LightTheme.secondaryBackgroundColor) ,
                        value: true, onChanged: (value){}),
                    Text("I agree to",style: LightTheme.textFieldHint,),
                    Text(" Privacy Policy ",style: LightTheme.navigationTextStyle,),
                    Text("and",style: LightTheme.textFieldHint),
                    Text(" Terms of use",style: LightTheme.navigationTextStyle),
                  ],
                ),
                SizedBox(height: 20,),
                MyButton.primaryButton(text: "Create Account", onTap: (){}),

              ],
            ))
          ],
        ),
      ),
    );
  }
}
