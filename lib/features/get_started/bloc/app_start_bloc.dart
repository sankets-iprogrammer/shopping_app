import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import '../../../core/services/storage_services/shared_preferences_service.dart';
import 'app_start_event.dart';
import 'app_start_state.dart';

class AppStartBloc extends Bloc<AppStartEvent, AppStartState> {
  AppStartBloc() : super(AppStartLoading()) {
    on<SetOnboardingCompleteEvent>(_setOnboardingComplete);
    on<CheckAppStartStatusEvent>((event, emit) async {
      final result =await Future.wait([
        Future.delayed(Duration(seconds: 3)),
        SharedPreferencesServices.isFirstTimeStart(),
        SharedPreferencesServices.isLoggedIn()
      ]);
      final isFirstTimeStart = result[1];
      if (isFirstTimeStart) {
        emit(NavigateToOnboardingScreen());
        log("NavigateToOnboardingScreen()");
        return;
      }
      final isLoggedIn = result[2];
      if (isLoggedIn) {
        emit(NavigateToHomeScreen());
        log("NavigateToHomeScreen");
      } else {
        emit(NavigateToLoginScreen());
        log("NavigateToLoginScreen");
      }
    });
  }

  void _setOnboardingComplete(SetOnboardingCompleteEvent event ,emit){
    SharedPreferencesServices.setFirstTimeStartFalse();
  }
}
