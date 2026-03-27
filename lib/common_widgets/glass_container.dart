import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/design_system.dart';

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

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(design.cardRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur ?? design.cardBlur,
            sigmaY: blur ?? design.cardBlur,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color ?? design.glassBackground,
              borderRadius: borderRadius ?? BorderRadius.circular(design.cardRadius),
              border: border ?? Border.all(color: design.glassBorder, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
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
