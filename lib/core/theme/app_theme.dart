import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';

class AppTheme {
  static ThemeData getThemeFromConfig(ThemeConfig config, {bool isDark = false}) {
    final design = AppDesignSystem.fromConfig(config);
    final baseColor = design.primary;

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: baseColor,
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: baseColor,
        secondary: design.secondary,
        surface: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF8F9FA),
      ),
      textTheme: AppUIConfig.textTheme,
      extensions: [design],
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(design.cardRadius),
        ),
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: AppUIConfig.primaryFont.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  // Backwards compatibility for now
  static ThemeData get lightTheme => getThemeFromConfig(ThemeConfig.studentDefault(), isDark: false);
  static ThemeData get darkTheme => getThemeFromConfig(ThemeConfig.studentDefault(), isDark: true);
}
