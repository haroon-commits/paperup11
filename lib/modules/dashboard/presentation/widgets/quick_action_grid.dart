import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class QuickActionItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  QuickActionItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

class QuickActionGrid extends StatelessWidget {
  final List<QuickActionItem> actions;

  const QuickActionGrid({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    final design = Theme.of(context).design;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isTablet ? 3 : 2,
        crossAxisSpacing: AppUIConfig.metrics.spacingDefault,
        mainAxisSpacing: AppUIConfig.metrics.spacingDefault,
        childAspectRatio: Responsive.isTablet ? 2.0 : 1.6,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final colors = [
          design.primary,
          AppUIConfig.colors.danger,
          AppUIConfig.colors.success,
          AppUIConfig.colors.warning,
          AppUIConfig.colors.teacherTheme,
        ];
        final cardColor = colors[index % colors.length];
        final action = actions[index];
        
        return GlassContainer(
          borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusLarge),
          color: cardColor.withOpacity(0.08),
          border: Border.all(color: cardColor.withOpacity(0.2), width: 1.5),
          child: InkWell(
            onTap: action.onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppUIConfig.metrics.paddingDefault,
                  vertical: AppUIConfig.metrics.paddingSmall),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppUIConfig.metrics.paddingTiny + 2),
                    decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      action.icon,
                      color: cardColor,
                      size: AppUIConfig.metrics.iconSizeDefault,
                    ),
                  ),
                  SizedBox(width: AppUIConfig.metrics.paddingSmall),
                  Expanded(
                    child: Text(
                      action.label,
                      style: AppUIConfig.text.bodySemiBold.copyWith(
                        fontSize: 13.s,
                        color: AppUIConfig.colors.white,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            color: AppUIConfig.colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).animate().scale(
          delay: (index * 100).ms,
          duration: 400.ms,
          curve: Curves.easeOutBack,
        );
      },
    );
  }
}
