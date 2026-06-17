import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  @override
  Widget build(BuildContext context){
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let’s Get You Registered",style: theme.pageTitle,),
            SizedBox(height: 10,),
            Text("Register to Access Exclusive Deals and Simplify Your Shopping Experience",style: theme.pageDesc,),
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
                              decoration: theme.textFieldDecoration(label: "First Name", hintText:"First Name",iconData:Icons.person_outline)
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                              decoration: theme.textFieldDecoration(label: "Last Name",hintText:"Last Name",iconData:Icons.person_outline)
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                        decoration: theme.textFieldDecoration(label: "Email",hintText:"Email",iconData:Icons.email_outlined)
                    ),

                    TextFormField(
                        decoration: theme.textFieldDecoration(label: "Phone Number",hintText:"Phone Number",iconData:Icons.call_outlined)
                    ),

                    TextFormField(
                        decoration: theme.textFieldDecoration(label: "Password",hintText:"Password",iconData:Icons.password_outlined,suffixIcon: Icons.visibility_outlined)
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: theme.secondaryOnBackgroundColor,
                        fillColor:WidgetStatePropertyAll(theme.secondaryBackgroundColor) ,
                        value: true, onChanged: (value){}),
                    Text("I agree to",style: theme.textFieldHint,),
                    Text(" Privacy Policy ",style: theme.navigationTextStyle,),
                    Text("and",style: theme.textFieldHint),
                    Text(" Terms of use",style: theme.navigationTextStyle),
                  ],
                ),
                SizedBox(height: 20,),
                MyButton.primaryButton(text: "Create Account", onTap: (){},theme:theme),

              ],
            ))
          ],
        ),
      ),
    );
  }
}
