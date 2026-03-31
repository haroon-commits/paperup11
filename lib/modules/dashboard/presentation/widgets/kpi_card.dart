import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class KPICard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const KPICard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.all(AppUIConfig.metrics.paddingDefault),
      color: color.withOpacity(0.05),
      border: Border.all(color: color.withOpacity(0.2), width: 1.5),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppUIConfig.components.containerRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppUIConfig.metrics.paddingSmall),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: AppUIConfig.components.inputRadius,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: AppUIConfig.colors.white, size: 22),
            ),
            const Spacer(),
            Text(
              title.toUpperCase(),
              style: AppUIConfig.text.chip.copyWith(
                fontSize: 11,
                color: AppUIConfig.colors.white.withOpacity(0.9),
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    color: AppUIConfig.colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppUIConfig.metrics.spacingTiny),
            Text(
              value,
              style: AppUIConfig.text.heading1.copyWith(
                fontSize: 34,
                color: AppUIConfig.colors.white,
                shadows: [
                  Shadow(
                    color: AppUIConfig.colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0);
  }
}
