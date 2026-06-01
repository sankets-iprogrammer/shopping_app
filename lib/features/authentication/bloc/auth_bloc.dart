import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/authentication/bloc/auth_event.dart';
import 'package:shopping_app/features/authentication/bloc/auth_state.dart';
import 'package:shopping_app/network/api_call.dart';
import 'package:shopping_app/network/api_exception.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<LoginEvent>(_login);
    on<SignupEvent>(_signup);
  }

  Future<void> _login(
      LoginEvent event,
      emit
      ) async{
    emit(AuthLoading());
    try{
      await ApiCall.login(event.loginRequest);
      emit(LoginSuccess());

    }on ApiException catch (e){
      log(e.toString());
      emit(AuthError(e.message));
    }catch(e){
      emit(AuthError("Unknown Error"));
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

