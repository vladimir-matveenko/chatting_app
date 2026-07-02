import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/constants/app_constants.dart';

abstract class ThemeLocalDataSource {
  Future<void> setTheme(String mode);

  String? getTheme();
}

@LazySingleton(as: ThemeLocalDataSource)
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  ThemeLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<void> setTheme(String value) async {
    await sharedPreferences.setString(AppConstants.themeKey, value);
  }

  @override
  String? getTheme() {
    return sharedPreferences.getString(AppConstants.themeKey);
  }
}
