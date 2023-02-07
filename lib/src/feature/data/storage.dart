import 'package:flutter/animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Setter and Getter of user data, like a themeMode, favs, and etc
class LocalStorage with _LocalStorageCache, _LocalStorageApi {
  LocalStorage._();
  static final LocalStorage _$instance = LocalStorage._();
  static LocalStorage get instance => _$instance;
}

mixin _LocalStorageCache {
  //init storage
  late final Future<SharedPreferences> _$db = SharedPreferences.getInstance();
  Future<T> _eval<T>(T Function(SharedPreferences db) fn) => _$db.then(fn);
}

mixin _LocalStorageApi on _LocalStorageCache {
  Future<void> setCurretUserTheme(bool isDark) =>
      _eval<void>((db) => db.setBool('THEMEMODE', isDark));
  Future<bool?> getUserTheme() => _eval((db) => db.getBool('THEMEMODE'));

  Future<void> setAccentColor(Color color) =>
      _eval<void>((db) => db.setInt('ACCENTCOLOR', color.value));

  Future<Color> getAccentColor() =>
      _eval((db) => Color(db.getInt('ACCENTCOLOR') ?? 0xFF006BA6));

  Future<void> setLocale(String localeCode) =>
      _eval<void>((db) => db.setString('LOCALE', localeCode));
  Future<String?> getLocale() => _eval<String?>((db) => db.getString('LOCALE'));
}
