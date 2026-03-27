import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';

class ThemeNotifier extends Notifier<Map<String, ThemeConfig>> {
  @override
  Map<String, ThemeConfig> build() {
    final prefs = ref.watch(sharedPrefsProvider);
    final Map<String, ThemeConfig> loadedThemes = {};
    for (final role in ['student', 'parent', 'teacher']) {
      final jsonStr = prefs.getString('theme_$role');
      if (jsonStr != null) {
        try {
          loadedThemes[role] = ThemeConfig.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
        } catch (e) {
          loadedThemes[role] = _getDefault(role);
        }
      } else {
        loadedThemes[role] = _getDefault(role);
      }
    }
    return loadedThemes;
  }

  ThemeConfig _getDefault(String role) {
    if (role == 'teacher') return ThemeConfig.teacherDefault();
    if (role == 'parent') return ThemeConfig.parentDefault();
    return ThemeConfig.studentDefault();
  }

  Future<void> updateTheme(String role, ThemeConfig config) async {
    final prefs = ref.read(sharedPrefsProvider);
    state = {
      ...state,
      role: config,
    };
    await prefs.setString('theme_$role', json.encode(config.toJson()));
  }

  ThemeConfig getConfig(String role) => state[role] ?? _getDefault(role);
}

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final themeNotifierProvider = NotifierProvider<ThemeNotifier, Map<String, ThemeConfig>>(() {
  return ThemeNotifier();
});
