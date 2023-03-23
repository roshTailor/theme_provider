import 'package:flutter/cupertino.dart';
import 'package:theme_provider/Preference/preference.dart';

class ThemeProvider extends ChangeNotifier{
  late bool _isDark;
  late ThemePreference _preference;
  bool get isDark=>_isDark;

  ThemeProvider(){
    _isDark=false;
    _preference=ThemePreference();
  }

  set isDark(bool value){
    _isDark=value;
    _preference.setTheme(value);
    notifyListeners();
  }
  getPreference()async{
    _isDark =await _preference.getTheme();
    notifyListeners();
  }
}