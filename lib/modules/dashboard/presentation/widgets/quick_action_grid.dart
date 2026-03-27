import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';

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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.6,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final colors = [design.primary, const Color(0xFFFF2D55), const Color(0xFF34C759), const Color(0xFFFF9500), const Color(0xFFAF52DE)];
        final cardColor = colors[index % colors.length];
        final action = actions[index];
        
        return GlassContainer(
          borderRadius: BorderRadius.circular(24),
          color: cardColor.withOpacity(0.08),
          border: Border.all(color: cardColor.withOpacity(0.2), width: 1.5),
          child: InkWell(
            onTap: action.onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      action.icon,
                      color: cardColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      action.label,
                      style: GoogleFonts.outfit(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
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
