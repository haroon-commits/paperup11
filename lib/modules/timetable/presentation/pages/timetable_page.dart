import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {'time': '08:30 AM', 'subject': 'Mathematics', 'room': 'Room 101', 'color': AppUIConfig.colors.subjectMath},
      {'time': '09:30 AM', 'subject': 'Physics', 'room': 'Lab A', 'color': AppUIConfig.colors.subjectPhysics},
      {'time': '10:30 AM', 'subject': 'Break', 'room': 'Cafeteria', 'color': AppUIConfig.colors.subjectBreak},
      {'time': '11:00 AM', 'subject': 'English', 'room': 'Room 203', 'color': AppUIConfig.colors.subjectEnglish},
      {'time': '12:00 PM', 'subject': 'Chemistry', 'room': 'Lab B', 'color': AppUIConfig.colors.subjectChemistry},
    ];

    return Scaffold(
      body: Column(
        children: [
          LiquidHeader(
            title: AppUIConfig.strings.timetableTitle,
            subtitle: AppUIConfig.strings.timetableSubtitle,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: AppUIConfig.metrics.paddingDefault),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppUIConfig.metrics.paddingLarge),
              child: Row(
                children: [
                  _DayChip(label: 'Mon', isSelected: true),
                  SizedBox(width: AppUIConfig.metrics.spacingSmall),
                  _DayChip(label: 'Tue'),
                  SizedBox(width: AppUIConfig.metrics.spacingSmall),
                  _DayChip(label: 'Wed'),
                  SizedBox(width: AppUIConfig.metrics.spacingSmall),
                  _DayChip(label: 'Thu'),
                  SizedBox(width: AppUIConfig.metrics.spacingSmall),
                  _DayChip(label: 'Fri'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: AppUIConfig.components.pagePadding,
              itemCount: schedule.length,
              separatorBuilder: (context, index) => SizedBox(height: AppUIConfig.metrics.spacingDefault),
              itemBuilder: (context, index) {
                final item = schedule[index];
                final isBreak = item['subject'] == 'Break';
                final accentColor = item['color'] as Color;

                return GlassContainer(
                  padding: AppUIConfig.components.cardPadding,
                  border: Border.all(color: accentColor.withOpacity(0.3), width: 1.5),
                  child: Row(
                    children: [
                      Container(
                        width: 80.s,
                        padding: EdgeInsets.symmetric(vertical: AppUIConfig.metrics.paddingTiny),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [accentColor, accentColor.withOpacity(0.7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: AppUIConfig.components.inputRadius,
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.3),
                              blurRadius: 12.s,
                              offset: Offset(0, 4.s),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            item['time'] as String,
                            style: AppUIConfig.text.chip,
                          ),
                        ),
                      ),
                      SizedBox(width: AppUIConfig.metrics.spacingDefault),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['subject'] as String,
                              style: AppUIConfig.text.heading3,
                            ),
                            SizedBox(height: AppUIConfig.metrics.spacingTiny),
                            Text(
                              item['room'] as String,
                              style: AppUIConfig.text.caption.copyWith(
                                color: AppUIConfig.colors.textLight,
                                fontSize: 13.s,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isBreak ? Icons.coffee_rounded : Icons.chevron_right,
                        color: AppUIConfig.colors.cardBorder,
                        size: AppUIConfig.metrics.iconSizeDefault,
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: (index * 80).ms).slideX(begin: 0.1, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _DayChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppUIConfig.metrics.paddingDefault, 
        vertical: AppUIConfig.metrics.paddingTiny
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppUIConfig.colors.glassHighlight : AppUIConfig.colors.primaryBackground.withOpacity(0.05),
        borderRadius: AppUIConfig.components.inputRadius,
        border: Border.all(
          color: isSelected ? AppUIConfig.colors.cardBorder : AppUIConfig.colors.primaryBackground.withOpacity(0.1),
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppUIConfig.text.chip.copyWith(
          fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold,
          color: isSelected ? AppUIConfig.colors.textMain : AppUIConfig.colors.textLight,
        ),
      ),
    );
  }
}
