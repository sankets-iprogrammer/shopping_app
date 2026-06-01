import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'onboarding_screen.dart';
import '../bloc/app_start_bloc.dart';
import '../bloc/app_start_event.dart';
import '../bloc/app_start_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    context.read<AppStartBloc>().add(
      CheckAppStartStatusEvent()
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocListener<AppStartBloc,AppStartState>(
          listener: (context,state){
            if(state is NavigateToOnboardingScreen){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
            }
          },
        child:Center(
          child:Image.asset('assets/logo/black_app_logo.png',width: 200,),
        ),
      ),


    );
  }
}
