import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';

class NeoContainer extends StatelessWidget {
  final Widget? child;
  final double blur;
  final Offset offset;
  final double? borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isPressed;

  const NeoContainer({
    super.key,
    this.child,
    this.blur = 12,
    this.offset = const Offset(6, 6),
    this.borderRadius,
    this.color,
    this.padding,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? AppUIConfig.colors.white;
    final r = borderRadius ?? AppUIConfig.metrics.radiusLarge;
    
    // Calculate highlight and shadow colors
    final hsl = HSLColor.fromColor(baseColor);
    final highlight = hsl.withLightness((hsl.lightness + 0.1).clamp(0.0, 1.0)).toColor();
    final shadow = hsl.withLightness((hsl.lightness - 0.15).clamp(0.0, 1.0)).toColor();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: padding,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(r),
        gradient: isPressed
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  shadow.withOpacity(0.2),
                  baseColor,
                  highlight.withOpacity(0.2),
                ],
              )
            : null,
        border: isPressed
            ? Border.all(color: shadow.withOpacity(0.2), width: 1.5)
            : Border.all(color: highlight.withOpacity(0.1), width: 0.5),
        boxShadow: isPressed
            ? [
                BoxShadow(
                  color: highlight.withOpacity(0.3),
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                ),
              ]
            : [
                BoxShadow(
                  color: shadow.withOpacity(0.4),
                  offset: offset,
                  blurRadius: blur,
                ),
                BoxShadow(
                  color: highlight.withOpacity(0.7),
                  offset: -offset,
                  blurRadius: blur,
                ),
              ],
      ),
      child: child,
    );
  }
}
