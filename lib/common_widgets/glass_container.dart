import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? blur;
  final Color? color;
  final BoxBorder? border;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final AppDesignSystem design = Theme.of(context).design;
    final fallbackRadius = BorderRadius.circular(AppUIConfig.metrics.radiusLarge);

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppUIConfig.colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? fallbackRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur ?? design.cardBlur,
            sigmaY: blur ?? design.cardBlur,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color ?? AppUIConfig.colors.cardBackground,
              borderRadius: borderRadius ?? fallbackRadius,
              border: border ?? Border.all(color: AppUIConfig.colors.cardBorder, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppUIConfig.colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: AppUIConfig.colors.white.withOpacity(0.05),
                  blurRadius: 1,
                  offset: const Offset(-1, -1), // Top-left inner glow
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
