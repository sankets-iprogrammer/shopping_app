import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/light_theme.dart';
class PasswordResetEmailSentSuccessScreen extends StatelessWidget {
  const PasswordResetEmailSentSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/authentication/email_password_reset_success.png"),
            Text("Password Reset Email Sent",style: LightTheme.pageTitle,textAlign: TextAlign.center),
            SizedBox(height: 10,),
            Text("unknownpro@gmail.com",style: LightTheme.sectionTitle,),
            SizedBox(height: 10,),
            Text("We’ve sent a password reset link to your email. Please check your inbox and follow the instructions to reset your password",style: LightTheme.pageDesc,textAlign: TextAlign.center,),
            SizedBox(height: 48,),
            MyButton.primaryButton(text: "Done", onTap: (){}),
            SizedBox(height: 16,),
            Text("Resend Email",style: LightTheme.navigationTextStyle,)
          ],
        ),
      ),
    );
  }
}
