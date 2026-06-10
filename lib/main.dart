import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/global_messanger.dart';
import 'package:shopping_app/core/helpers/global_navigator.dart';
import 'package:shopping_app/core/network_project/api_client.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import 'package:shopping_app/features/authentication/bloc/auth_bloc.dart';
import 'package:shopping_app/features/authentication/screens/login_screen.dart';
import 'package:shopping_app/features/cart_and_order/widgets/address_card.dart';
import 'package:shopping_app/features/home_page/bloc/home_bloc.dart';
import 'package:shopping_app/features/home_page/screens/home_screen.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:shopping_app/features/main_screen/screens/main_screen.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/screens/address_list_screen.dart';
import 'features/get_started/bloc/app_start_bloc.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AppStartBloc()),
      BlocProvider(create: (_) => AuthBloc()),
      BlocProvider(create: (_) => HomeBloc()),
      BlocProvider(create: (_) => MainScreenBloc()),
      BlocProvider(create: (_) => ProfileBloc())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalNavigator.navigatorKey,
      scaffoldMessengerKey: GlobalMessenger.globalMessengerKey,
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

