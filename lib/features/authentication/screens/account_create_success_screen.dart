import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/app_theme.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
class AccountCreateSuccessScreen extends StatelessWidget {
  const AccountCreateSuccessScreen({super.key});
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
            Image.asset("assets/authentication/account_create_success.png"),
            Text("Your account successfully created",style: theme.pageTitle,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text("unknownpro@gmail.com",style: theme.sectionTitle,),
            SizedBox(height: 10,),
            Text("Congratulations! Your account has been successfully created. You can now explore all the amazing features, start personalizing your experience, and enjoy seamless access to our services. Let’s get started!",style: theme.pageDesc,textAlign: TextAlign.center),
            SizedBox(height: 48,),
            MyButton.primaryButton(text: "Continue", onTap: (){},theme: theme),

          ],
        ),
      ),
    );
  }
}
