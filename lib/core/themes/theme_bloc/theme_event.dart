import 'package:shopping_app/core/themes/model/theme_option_model.dart';

abstract class ThemeEvent {}
class ChangeThemeEvent extends ThemeEvent{
  ThemeOptionModel theme;
  ChangeThemeEvent({required this.theme});
}
