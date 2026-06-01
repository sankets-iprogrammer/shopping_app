import 'package:flutter/material.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import '../../../core/themes/light_theme.dart';
class AccountCreateSuccessScreen extends StatelessWidget {
  const AccountCreateSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/authentication/account_create_success.png"),
            Text("Your account successfully created",style: LightTheme.pageTitle,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text("unknownpro@gmail.com",style: LightTheme.sectionTitle,),
            SizedBox(height: 10,),
            Text("Congratulations! Your account has been successfully created. You can now explore all the amazing features, start personalizing your experience, and enjoy seamless access to our services. Let’s get started!",style: LightTheme.pageDesc,textAlign: TextAlign.center),
            SizedBox(height: 48,),
            MyButton.primaryButton(text: "Continue", onTap: (){}),

          ],
        ),
      ),
    );
  }
}
