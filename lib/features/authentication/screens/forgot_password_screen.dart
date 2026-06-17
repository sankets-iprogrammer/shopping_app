import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.read<ThemeBloc>().state.currentTheme;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.pageHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forget Password", style: theme.pageTitle),
            SizedBox(height: 10),
            Text(
              "No worries! Enter your registered email address, and we’ll help you reset your password",
              style: theme.pageDesc,
            ),
            SizedBox(height: 24),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: theme.textFieldDecoration(
                      label: "Email",
                      hintText: "Email",
                      iconData: Icons.email_outlined,
                    ),
                  ),
                  SizedBox(height: 20),
                  MyButton.primaryButton(
                    theme: theme,
                    text: "Sign In",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
