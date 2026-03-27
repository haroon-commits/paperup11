import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';
import 'package:paperup1/core/theme/state/theme_notifier.dart';
import 'package:paperup1/common_widgets/liquid_background.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';

class PageBackground extends ConsumerWidget {
  final Widget child;
  const PageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final role = user?.role ?? 'student';
    final config = ref.watch(themeNotifierProvider)[role] ?? ThemeConfig.studentDefault();
    final design = Theme.of(context).design;

    return Stack(
      children: [
        // Base Gradient
        Container(
          decoration: BoxDecoration(
            gradient: design.liquidGradient,
          ),
        ),
        
        // Animated Layer (if enabled)
        if (config.useAnimatedBackground)
          LiquidBackground(
            colors: [
              design.primary,
              design.secondary.withOpacity(0.5),
              design.accent.withOpacity(0.3),
            ],
          ),
          
        // Content
        SafeArea(child: child),
      ],
    );
  }
}
