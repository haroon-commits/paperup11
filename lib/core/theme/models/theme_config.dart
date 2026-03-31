import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';

enum ThemeStyle { glass, neo, minimalist }

class ThemeConfig {
  final ThemeStyle style;
  final Color primaryColor;
  final bool useAnimatedBackground;
  final double borderRadius;

  const ThemeConfig({
    required this.style,
    required this.primaryColor,
    required this.useAnimatedBackground,
    this.borderRadius = 24.0,
  });

  Map<String, dynamic> toJson() => {
    'style': style.name,
    'primaryColor': primaryColor.value,
    'useAnimatedBackground': useAnimatedBackground,
    'borderRadius': borderRadius,
  };

  factory ThemeConfig.fromJson(Map<String, dynamic> json) => ThemeConfig(
    style: ThemeStyle.values.byName(json['style'] as String),
    primaryColor: Color(json['primaryColor'] as int),
    useAnimatedBackground: json['useAnimatedBackground'] as bool,
    borderRadius: (json['borderRadius'] as num).toDouble(),
  );

  ThemeConfig copyWith({
    ThemeStyle? style,
    Color? primaryColor,
    bool? useAnimatedBackground,
    double? borderRadius,
  }) {
    return ThemeConfig(
      style: style ?? this.style,
      primaryColor: primaryColor ?? this.primaryColor,
      useAnimatedBackground:
          useAnimatedBackground ?? this.useAnimatedBackground,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  static ThemeConfig studentDefault() => const ThemeConfig(
    style: ThemeStyle.glass,
    primaryColor: AppUIConfig.studentPrimary,
    useAnimatedBackground: false,
  );

  static ThemeConfig parentDefault() => const ThemeConfig(
    style: ThemeStyle.glass,
    primaryColor: AppUIConfig.parentPrimary,
    useAnimatedBackground: false,
  );

  static ThemeConfig teacherDefault() => const ThemeConfig(
    style: ThemeStyle.glass,
    primaryColor: AppUIConfig.teacherPrimary,
    useAnimatedBackground: false,
  );
}
