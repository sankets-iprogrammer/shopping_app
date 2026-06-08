import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/features/authentication/bloc/auth_event.dart';
import 'package:shopping_app/features/authentication/bloc/auth_state.dart';
import 'package:shopping_app/features/authentication/data/auth_repository.dart';

import '../../../network/api_exception.dart';


class AuthBloc extends Bloc<AuthEvent,AuthState>{
  final AuthRepository repository;
  AuthBloc(this.repository):super(AuthInitial()){
    on<LoginEvent>(_login);
    on<SignupEvent>(_signup);
  }

  Future<void> _login(
      LoginEvent event,
      emit
      ) async{
    emit(AuthLoading());
    try{
      await repository.login(event.loginRequest);


      // final results=await Future.wait([
      // ApiCalls.getCurrentUser(),
      // ApiCalls.getCurrentUser(),
      // ApiCalls.getCurrentUser(),
      // ApiCalls.getCurrentUser(),
      // ]);
      //
      // for(final result in results){
      //   log("this is api response data got for original call");
      //   log(result.toString());
      // }


      emit(LoginSuccess());
    }on DioException catch(e){
      if(e.error is ApiException){
        emit(AuthError((e.error as ApiException).message));
      }else{
        emit(AuthError(e.message??"Unknown Error"));
      }
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

