import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_state.dart';

class MainScreenBloc  extends Bloc<MainScreenEvents,MainScreenActiveState>{
  MainScreenBloc():super(MainScreenActiveState.initial()){
    on<SetPageIndexEvent>(_setPageIndex);
    on<LogoutEvent>(_logout);
  }
  void _setPageIndex(SetPageIndexEvent event,emit){
      emit(state.copyWith(currentPageIndex: event.index));
  }
  void _logout(LogoutEvent event,emit){
    emit(state.copyWith(logoutState: true));
  }
  }
