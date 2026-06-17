import 'package:shopping_app/core/themes/app_theme.dart';
import 'package:shopping_app/core/themes/model/theme_option_model.dart';

class ThemeState {
  final AppTheme currentTheme;
  final String currentThemeID;
  final List<ThemeOptionModel> themes;
  ThemeState({required this.currentTheme,required this.themes,required this.currentThemeID});
  ThemeState copyWith({
    AppTheme? currentTheme,
    List<ThemeOptionModel>? themes,
    String? currentThemeID
}){
    return ThemeState(
        currentTheme: currentTheme??this.currentTheme,
        themes: themes??this.themes,
      currentThemeID: currentThemeID??this.currentThemeID

    );
  }
}