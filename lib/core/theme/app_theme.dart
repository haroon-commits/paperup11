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
        surface: isDark ? const Color(0xFF1A1A1A) : AppUIConfig.colors.primaryBackground,
      ),
      extensions: [design],
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(design.cardRadius),
        ),
        color: isDark ? AppUIConfig.colors.white.withOpacity(0.05) : AppUIConfig.colors.white,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppUIConfig.colors.transparent,
        elevation: 0,
        titleTextStyle: AppUIConfig.text.heading3.copyWith(
          fontSize: 20,
          color: isDark ? AppUIConfig.colors.white : AppUIConfig.colors.black,
        ),
      ),
    );
  }

  // Backwards compatibility for now
  static ThemeData get lightTheme => getThemeFromConfig(ThemeConfig.studentDefault(), isDark: false);
  static ThemeData get darkTheme => getThemeFromConfig(ThemeConfig.studentDefault(), isDark: true);
}
