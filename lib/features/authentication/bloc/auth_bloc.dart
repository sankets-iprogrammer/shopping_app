import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import 'package:shopping_app/core/services/storage_services/shared_preferences_service.dart';
import 'package:shopping_app/features/authentication/bloc/auth_event.dart';
import 'package:shopping_app/features/authentication/bloc/auth_state.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';
import '../../../core/network_project/api_exception.dart';


class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<LoginEvent>(_login);
    on<SignupEvent>(_signup);
  }

  Future<LoginResponse?> _login(
      LoginEvent event,
      emit
      ) async{
    emit(AuthLoading());
    try{
      LoginResponse loginResponse= await ApiCalls.login(event.loginRequest);
      await SecureStorage.addUserLoginData(loginResponse);
      await SharedPreferencesServices.setLoggedIn(true);
      emit(LoginSuccess());
      return loginResponse;
    }on DioException catch(e){
      if(e.error is ApiException){
        emit(AuthError((e.error as ApiException).message));
      }else{
        emit(AuthError(e.message??"Unknown Error"));
      }
      return null;
    }catch(e){
      emit(AuthError("Unknown Error"));
      return null;
    }
  }
}


Future<void> _signup(
    SignupEvent event,
    emit
    ) async{
  emit(AuthLoading());
  try{
    await Future.delayed(
        Duration(seconds: 3));
    emit(LoginSuccess());

  }catch(e){
    emit(AuthError("error  in registration"));
  }
}

