import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/dark_theme.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/core/themes/model/theme_option_model.dart';
import 'package:shopping_app/core/themes/theme_bloc/theme_event.dart';
import 'package:shopping_app/core/themes/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ThemeBloc():super(
      ThemeState(
        currentThemeID: "light",
      currentTheme: LightTheme(),
    themes: [
      ThemeOptionModel(id: "light",iconData: Icons.light_mode_outlined, title: "Light Theme", theme: LightTheme()),
      ThemeOptionModel(id: "dark",iconData: Icons.dark_mode_outlined, title: "Dark Theme", theme: DarkTheme()),
    ]
  )){
    on<ChangeThemeEvent>(_changeTheme);
  }

  void _changeTheme(ChangeThemeEvent event, emit){
    emit(state.copyWith(currentTheme: event.theme.theme,currentThemeID: event.theme.id));
  }
}