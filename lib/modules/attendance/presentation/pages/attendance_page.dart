import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/modules/attendance/presentation/state/attendance_provider.dart';
import 'package:intl/intl.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final user = ref.read(authProvider).user;
      if (user != null) {
        ref.read(attendanceProvider.notifier).fetchLogs(user.id, DateTime.now());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final attendanceState = ref.watch(attendanceProvider);
    final userRole = ref.watch(authProvider).user?.role ?? 'student';

    return Scaffold(
      body: Column(
        children: [
          LiquidHeader(
            title: AppUIConfig.strings.attendance,
            subtitle: AppUIConfig.strings.attendanceSubtitle,
            trailing: userRole == 'teacher'
                ? IconButton(
                    icon: Icon(Icons.add_circle, color: AppUIConfig.colors.white, size: 30),
                    onPressed: () {},
                  )
                : null,
          ),
          Expanded(
            child: attendanceState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('${AppUIConfig.strings.errorPrefix} $err')),
              data: (logs) {
                return ListView.separated(
                  padding: AppUIConfig.components.pagePadding,
                  itemCount: logs.length,
                  separatorBuilder: (context, index) => SizedBox(height: AppUIConfig.metrics.spacingDefault),
                  itemBuilder: (context, index) {
                    final log = logs[index];

                    return GlassContainer(
                      padding: AppUIConfig.components.cardPadding,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [_getStatusColor(log.status), _getStatusColor(log.status).withOpacity(0.7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusDefault),
                              boxShadow: [
                                BoxShadow(
                                  color: _getStatusColor(log.status).withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: -5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    log.date.day.toString(),
                                    style: AppUIConfig.text.heading1.copyWith(
                                      fontSize: 24,
                                      color: AppUIConfig.colors.white,
                                      shadows: [
                                        Shadow(
                                          color: AppUIConfig.colors.shadowDark,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    _getMonthName(log.date.month).substring(0, 3).toUpperCase(),
                                    style: AppUIConfig.text.caption.copyWith(
                                      fontSize: 9,
                                      color: AppUIConfig.colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: AppUIConfig.metrics.spacingDefault),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EEEE').format(log.date),
                                  style: AppUIConfig.text.heading2.copyWith(
                                    fontSize: 18,
                                    color: AppUIConfig.colors.white,
                                  ),
                                ),
                                SizedBox(height: AppUIConfig.metrics.spacingTiny),
                                Text(
                                  log.status.toUpperCase(),
                                  style: AppUIConfig.text.caption.copyWith(
                                    color: AppUIConfig.colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppUIConfig.metrics.paddingTiny, 
                              vertical: 4
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [_getStatusColor(log.status), _getStatusColor(log.status).withOpacity(0.8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusSmall),
                              boxShadow: [
                                BoxShadow(
                                  color: _getStatusColor(log.status).withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              log.status.toUpperCase(),
                              style: AppUIConfig.text.chip.copyWith(
                                color: AppUIConfig.colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: (index * 80).ms).slideX(begin: 0.1, end: 0);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Present':
        return AppUIConfig.colors.success;
      case 'Absent':
        return AppUIConfig.colors.danger;
      case 'Late':
        return AppUIConfig.colors.warning;
      default:
        return AppUIConfig.colors.textLight;
    }
  }

  String _getMonthName(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
  }
}
