import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  late SharedPreferences _prefs;

  SharedPrefs._internal();

  factory SharedPrefs() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter and Setter for String
  String? getString(String key) => _prefs.getString(key);
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);

  // Getter and Setter for Int
  int? getInt(String key) => _prefs.getInt(key);
  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);

  // Add other getters and setters as needed (bool, double, etc.)

   // Save a Map<String, dynamic> as a JSON string
  Future<bool> setMap(String key, Map<String, dynamic> value) {
    String jsonString = jsonEncode(value);
    return _prefs.setString(key, jsonString);
  }

  // Retrieve a Map<String, dynamic> from a JSON string
  Map<String, dynamic>? getMap(String key) {
    String? jsonString = _prefs.getString(key);
    if (jsonString == null) return null;

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
