import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {'time': '08:30 AM', 'subject': 'Mathematics', 'room': 'Room 101', 'color': const Color(0xFF007AFF)},
      {'time': '09:30 AM', 'subject': 'Physics', 'room': 'Lab A', 'color': const Color(0xFF5856D6)},
      {'time': '10:30 AM', 'subject': 'Break', 'room': 'Cafeteria', 'color': const Color(0xFF34C759)},
      {'time': '11:00 AM', 'subject': 'English', 'room': 'Room 203', 'color': const Color(0xFFAF52DE)},
      {'time': '12:00 PM', 'subject': 'Chemistry', 'room': 'Lab B', 'color': const Color(0xFFFF2D55)},
    ];

    return Scaffold(
      body: Column(
        children: [
          const LiquidHeader(
            title: 'Timetable',
            subtitle: 'Your Daily Schedule',
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
              padding: const EdgeInsets.all(24),
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
                            style: GoogleFonts.outfit(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
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
                              style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['room'] as String,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isBreak ? Icons.coffee_rounded : Icons.chevron_right,
                        color: Colors.white.withOpacity(0.3),
                        size: 20,
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
        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.1),
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.outfit(
          fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold,
          fontSize: 11,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
          letterSpacing: 1,
        ),
      ),
    );
  }
}
