import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/authentication/bloc/auth_bloc.dart';
import 'package:shopping_app/features/authentication/screens/login_screen.dart';
import 'package:shopping_app/features/authentication/screens/register_screen.dart';

import 'features/authentication/screens/account_create_success_screen.dart';
import 'features/authentication/screens/forgot_password_screen.dart' ;
import 'features/authentication/screens/password_email_sent_success_screen.dart';
import 'features/get_started/bloc/app_start_bloc.dart';
import 'features/main_screen/screens/main_screen.dart';


void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AppStartBloc()),
      BlocProvider(create: (_) => AuthBloc())
    ],
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}

