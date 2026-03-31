import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {'time': '08:30 AM', 'subject': 'Mathematics', 'room': 'Room 101', 'color': AppConfig.colors.subjectMath},
      {'time': '09:30 AM', 'subject': 'Physics', 'room': 'Lab A', 'color': AppConfig.colors.subjectPhysics},
      {'time': '10:30 AM', 'subject': 'Break', 'room': 'Cafeteria', 'color': AppConfig.colors.subjectBreak},
      {'time': '11:00 AM', 'subject': 'English', 'room': 'Room 203', 'color': AppConfig.colors.subjectEnglish},
      {'time': '12:00 PM', 'subject': 'Chemistry', 'room': 'Lab B', 'color': AppConfig.colors.subjectChemistry},
    ];

    return Scaffold(
      body: Column(
        children: [
          LiquidHeader(
            title: AppConfig.strings.timetableTitle,
            subtitle: AppConfig.strings.timetableSubtitle,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _DayChip(label: 'Mon', isSelected: true),
                  const SizedBox(width: 12),
                  _DayChip(label: 'Tue'),
                  const SizedBox(width: 12),
                  _DayChip(label: 'Wed'),
                  const SizedBox(width: 12),
                  _DayChip(label: 'Thu'),
                  const SizedBox(width: 12),
                  _DayChip(label: 'Fri'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(AppUIConfig.defaultPadding),
              itemCount: schedule.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = schedule[index];
                final isBreak = item['subject'] == 'Break';
                final accentColor = item['color'] as Color;

                return GlassContainer(
                  padding: const EdgeInsets.all(20),
                  border: Border.all(color: accentColor.withOpacity(0.3), width: 1.5),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [accentColor, accentColor.withOpacity(0.7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            item['time'] as String,
                            style: AppConfig.text.chip,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['subject'] as String,
                              style: AppConfig.text.heading3,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['room'] as String,
                              style: AppConfig.text.caption.copyWith(
                                color: AppConfig.colors.textLight,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isBreak ? Icons.coffee_rounded : Icons.chevron_right,
                        color: AppConfig.colors.cardBorder,
                        size: AppConfig.metrics.iconSizeDefault,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppConfig.colors.glassHighlight : AppConfig.colors.primaryBackground.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? AppConfig.colors.cardBorder : AppConfig.colors.primaryBackground.withOpacity(0.1),
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppConfig.text.chip.copyWith(
          fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold,
          color: isSelected ? AppConfig.colors.textMain : AppConfig.colors.textLight,
        ),
      ),
    );
  }
}
