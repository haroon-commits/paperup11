import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
// Required for lerpDouble

class AppDesignSystem extends ThemeExtension<AppDesignSystem> {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color glassBackground;
  final Color glassBorder;
  final LinearGradient liquidGradient;
  final LinearGradient cardGradient;
  final LinearGradient accentGradient;
  final double cardRadius;
  final double cardBlur;

  const AppDesignSystem({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.glassBackground,
    required this.glassBorder,
    required this.liquidGradient,
    required this.cardGradient,
    required this.accentGradient,
    this.cardRadius = 24.0,
    this.cardBlur = 15.0,
  });

  @override
  ThemeExtension<AppDesignSystem> copyWith({
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? glassBackground,
    Color? glassBorder,
    LinearGradient? liquidGradient,
    LinearGradient? cardGradient,
    LinearGradient? accentGradient,
    double? cardRadius,
    double? cardBlur,
  }) {
    return AppDesignSystem(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      glassBackground: glassBackground ?? this.glassBackground,
      glassBorder: glassBorder ?? this.glassBorder,
      liquidGradient: liquidGradient ?? this.liquidGradient,
      cardGradient: cardGradient ?? this.cardGradient,
      accentGradient: accentGradient ?? this.accentGradient,
      cardRadius: cardRadius ?? this.cardRadius,
      cardBlur: cardBlur ?? this.cardBlur,
    );
  }

  @override
  ThemeExtension<AppDesignSystem> lerp(
    ThemeExtension<AppDesignSystem>? other,
    double t,
  ) {
    if (other is! AppDesignSystem) return this;
    return AppDesignSystem(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      glassBackground:
          Color.lerp(glassBackground, other.glassBackground, t) ??
          glassBackground,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t) ?? glassBorder,
      liquidGradient:
          LinearGradient.lerp(liquidGradient, other.liquidGradient, t) ??
          liquidGradient,
      cardGradient:
          LinearGradient.lerp(cardGradient, other.cardGradient, t) ??
          cardGradient,
      accentGradient:
          LinearGradient.lerp(accentGradient, other.accentGradient, t) ??
          accentGradient,
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t),
      cardBlur: lerpDouble(cardBlur, other.cardBlur, t),
    );
  }

  static double lerpDouble(double a, double b, double t) => a + (b - a) * t;

  // Dynamic Factory
  factory AppDesignSystem.fromConfig(ThemeConfig config) {
    final primary = config.primaryColor;
    final secondary = Color.lerp(primary, Colors.white, 0.3)!;
    final accent = config.style == ThemeStyle.neo
        ? primary.withOpacity(0.8)
        : AppUIConfig.alertPrimary;

    return AppDesignSystem(
      primary: primary,
      secondary: secondary,
      accent: accent,
      glassBackground: config.style == ThemeStyle.glass
          ? Colors.white.withOpacity(0.12)
          : Colors.white.withOpacity(0.05),
      glassBorder: Colors.white.withOpacity(0.18),
      liquidGradient: LinearGradient(
        colors: [primary, primary.withOpacity(0.7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      cardGradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.05)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      accentGradient: LinearGradient(
        colors: [secondary, primary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      cardRadius: config.borderRadius,
      cardBlur: config.style == ThemeStyle.glass ? 25.0 : 0.0,
    );
  }

  // Role Defaults
  static AppDesignSystem student() =>
      AppDesignSystem.fromConfig(ThemeConfig.studentDefault());
  static AppDesignSystem parent() =>
      AppDesignSystem.fromConfig(ThemeConfig.parentDefault());
  static AppDesignSystem teacher() =>
      AppDesignSystem.fromConfig(ThemeConfig.teacherDefault());
}

extension AppDesignSystemExt on ThemeData {
  AppDesignSystem get design =>
      extension<AppDesignSystem>() ?? AppDesignSystem.student();
}
