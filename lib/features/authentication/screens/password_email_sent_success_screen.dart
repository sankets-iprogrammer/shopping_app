import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
class PasswordResetEmailSentSuccessScreen extends StatelessWidget {
  const PasswordResetEmailSentSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AppTheme theme =context.read<ThemeBloc>().state.currentTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/authentication/email_password_reset_success.png"),
            Text("Password Reset Email Sent",style: theme.pageTitle,textAlign: TextAlign.center),
            SizedBox(height: 10,),
            Text("unknownpro@gmail.com",style: theme.sectionTitle,),
            SizedBox(height: 10,),
            Text("We’ve sent a password reset link to your email. Please check your inbox and follow the instructions to reset your password",style: theme.pageDesc,textAlign: TextAlign.center,),
            SizedBox(height: 48,),
            MyButton.primaryButton(text: "Done", onTap: (){},theme:theme),
            SizedBox(height: 16,),
            Text("Resend Email",style: theme.navigationTextStyle,)
          ],
        ),
      ),
    );
  }
}
