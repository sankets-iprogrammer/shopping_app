import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/light_theme.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
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
            Text("Forget Password",style: LightTheme.pageTitle,),
            SizedBox(height: 10,),
            Text("No worries! Enter your registered email address, and we’ll help you reset your password",style: LightTheme.pageDesc,),
            SizedBox(height: 24,),
            Form(child: Column(
              children: [
                TextFormField(
                    decoration: LightTheme.textFieldDecoration(label: "Email", hintText:"Email",iconData:Icons.email_outlined)
                ),
                SizedBox(height: 20,),
                MyButton.primaryButton(text: "Sign In", onTap: (){}),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
