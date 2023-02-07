import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/feature/data/storage.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  Color _accentColor = const Color(0xFF006BA6);

  ThemeMode get themeMode => _themeMode;
  Color get accentColor => _accentColor;

  Future<void> getThemeMode() async {
    bool themeModeInStorage =
        await LocalStorage.instance.getUserTheme() ?? true;
    _themeMode = themeModeInStorage ? ThemeMode.dark : ThemeMode.light;
    _accentColor = await LocalStorage.instance.getAccentColor();
    notifyListeners();
  }

  setAccentColor(accentColor) {
    _accentColor = accentColor;
    LocalStorage.instance.setAccentColor(accentColor);
    notifyListeners();
  }

  setThemeMode(themeMode) {
    _themeMode = themeMode;
    if (themeMode == ThemeMode.dark) {
      LocalStorage.instance.setCurretUserTheme(true);
    } else {
      LocalStorage.instance.setCurretUserTheme(false);
    }
    notifyListeners();
  }
}
