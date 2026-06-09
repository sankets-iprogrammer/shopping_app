import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_state.dart';

class MainScreenBloc  extends Bloc<MainScreenEvents,MainScreenState>{
  MainScreenBloc():super(MainScreenState(currentPageIndex: 0)){
    on<SetPageIndexEvent>(_setPageIndex);
  }
  void _setPageIndex(SetPageIndexEvent event,emit){
    emit(MainScreenState(currentPageIndex: event.index));
  }
}