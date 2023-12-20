import 'package:flutter/cupertino.dart';

class PreferencesTheme{
  static ValueNotifier<Brightness> theme = ValueNotifier(Brightness.light);

  static setTheme() {
    theme.value = WidgetsBinding.instance!.platformDispatcher.platformBrightness;
  }
}
