import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_events.dart';
import 'package:shopping_app/features/main_screen/bloc/main_screen_state.dart';

class MainScreenBloc  extends Bloc<MainScreenEvents,MainScreenState>{
  MainScreenBloc():super(MainScreenState.initial()){
    on<SetPageIndexEvent>(_setPageIndex);
  }
  void _setPageIndex(SetPageIndexEvent event,emit){
    emit(state.copyWith(currentPageIndex: event.index));
  }

}