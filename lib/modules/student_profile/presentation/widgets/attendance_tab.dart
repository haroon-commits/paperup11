import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/modules/student_profile/presentation/state/student_profile_providers.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class AttendanceTab extends ConsumerWidget {
  const AttendanceTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthYear = ref.watch(currentAttendanceMonthYearProvider);
    final attendanceAsync = ref.watch(attendanceProvider(monthYear));

    return attendanceAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (summary) => SingleChildScrollView(
        padding: AppUIConfig.components.pagePadding,
        child: Column(
          children: [
            _buildStatsHeader(summary),
            SizedBox(height: AppUIConfig.metrics.spacingLarge),
            _buildCalendar(summary, monthYear, ref),
            SizedBox(height: 80.s),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsHeader(dynamic summary) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildStatItem('Working Days', summary.workingDays.toString(), AppUIConfig.colors.textMuted),
          SizedBox(width: AppUIConfig.metrics.spacingSmall),
          _buildStatItem('Present', summary.present.toString(), AppUIConfig.colors.success),
          SizedBox(width: AppUIConfig.metrics.spacingSmall),
          _buildStatItem('Absent', summary.absent.toString(), AppUIConfig.colors.danger),
          SizedBox(width: AppUIConfig.metrics.spacingSmall),
          _buildStatItem('Leave', summary.leave.toString(), AppUIConfig.colors.warning),
          SizedBox(width: AppUIConfig.metrics.spacingSmall),
          _buildStatItem('Late', summary.late.toString(), Colors.purple),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Container(
      width: 75.s, // Scaled width for items in scrollable row
      padding: EdgeInsets.symmetric(vertical: 12.s),
      decoration: BoxDecoration(
        color: AppUIConfig.colors.cardBackground,
        borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusSmall),
        border: Border.all(color: color.withOpacity(0.5), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            label, 
            style: AppUIConfig.text.caption.copyWith(fontSize: 9.s, color: AppUIConfig.colors.textLight),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.s),
          Text(
            value, 
            style: AppUIConfig.text.heading3.copyWith(color: AppUIConfig.colors.textMain, fontSize: 16.s),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar(dynamic summary, dynamic monthYear, WidgetRef ref) {
    final firstDayOfMonth = DateTime(monthYear.year, monthYear.month, 1);
    final lastDayOfMonth = DateTime(monthYear.year, monthYear.month + 1, 0);
    final paddingDays = firstDayOfMonth.weekday % 7; // Sunday=0, Monday=1, ...
    
    final monthName = DateFormat('MMMM yyyy').format(firstDayOfMonth);

    return GlassContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: AppUIConfig.colors.textMain),
                onPressed: () {
                   final newDate = DateTime(monthYear.year, monthYear.month - 1);
                   ref.read(currentAttendanceMonthYearProvider.notifier).update((month: newDate.month, year: newDate.year));
                },
              ),
              Text(monthName, style: AppUIConfig.text.heading2),
              IconButton(
                icon: Icon(Icons.chevron_right, color: AppUIConfig.colors.textMain),
                onPressed: () {
                   final newDate = DateTime(monthYear.year, monthYear.month + 1);
                   ref.read(currentAttendanceMonthYearProvider.notifier).update((month: newDate.month, year: newDate.year));
                },
              ),
            ],
          ),
          SizedBox(height: AppUIConfig.metrics.spacingDefault),
          // Day Names
          Row(
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map((day) => Expanded(
              child: Center(child: Text(day, style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textLight))),
            )).toList(),
          ),
          SizedBox(height: AppUIConfig.metrics.spacingDefault),
          // Day Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, 
              crossAxisSpacing: 8.s, 
              mainAxisSpacing: 8.s,
            ),
            itemCount: 42, // Fix grid slots
            itemBuilder: (context, index) {
              final dayNum = index - paddingDays + 1;
              if (dayNum < 1 || dayNum > lastDayOfMonth.day) return const SizedBox();
              
              final date = DateTime(monthYear.year, monthYear.month, dayNum);
              final dayMatches = summary.days.where(
                (d) => d.date.year == date.year && d.date.month == date.month && d.date.day == date.day,
              );
              final attendance = dayMatches.isNotEmpty ? dayMatches.first : null;
              
              Color bgColor = AppUIConfig.colors.cardBackground;
              if (attendance?.status == 'present') bgColor = AppUIConfig.colors.success.withOpacity(0.3);
              else if (attendance?.status == 'absent') bgColor = AppUIConfig.colors.danger.withOpacity(0.3);
              else if (attendance?.status == 'leave') bgColor = AppUIConfig.colors.warning.withOpacity(0.3);
              else if (attendance?.status == 'late') bgColor = Colors.purple.withOpacity(0.3);

              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusSmall),
                  border: Border.all(color: AppUIConfig.colors.white.withOpacity(0.05)),
                ),
                child: Text(dayNum.toString(), style: AppUIConfig.text.bodySemiBold.copyWith(fontSize: 12.s)),
              );
            },
          ),
        ],
      ),
    );
  }
}
