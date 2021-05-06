import 'package:hive/hive.dart';

class Preferences {
  static final _prefsBox = 'prefs';
  final _token = 'token';
  final Box _box;

  Preferences._(this._box);

  static Future<Preferences> init() async {
    final box = await Hive.openBox(_prefsBox);
    return Preferences._(box);
  }

  String get token => _box.get(_token, defaultValue: '0');
  set token(String value) => _box.put(_token, value);
}
