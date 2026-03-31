import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/modules/homework/presentation/state/homework_provider.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

import 'package:paperup1/common_widgets/page_background.dart';

class HomeworkPage extends ConsumerStatefulWidget {
  const HomeworkPage({super.key});

  @override
  ConsumerState<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends ConsumerState<HomeworkPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final user = ref.read(authProvider).user;
      if (user != null) {
        ref.read(homeworkProvider.notifier).fetchHomework(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeworkState = ref.watch(homeworkProvider);
    final userRole = ref.watch(authProvider).user?.role ?? 'student';

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageBackground(
        child: Column(
        children: [
                                     LiquidHeader(
            title: AppConfig.strings.homeworkTitle,
            subtitle: AppConfig.strings.homeworkSubtitle,
            trailing: userRole == 'teacher'
                ? IconButton(
                    icon: Icon(Icons.add_task, color: AppConfig.colors.textMain, size: AppConfig.metrics.iconSizeLarge),
                    onPressed: () {},
                  )
                : null,
             ), 
             Expanded(
            child: homeworkState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (assignments) {
                return ListView.separated(
                  padding: const EdgeInsets.all(AppUIConfig.defaultPadding),
                  itemCount: assignments.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = assignments[index];
                    final statusColor = _getStatusColor(item.status);

                    return GlassContainer(
                      padding: const EdgeInsets.all(20),
                      border: Border.all(color: statusColor.withOpacity(0.3), width: 1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Container(
                                 padding: EdgeInsets.symmetric(
                                     horizontal: AppConfig.metrics.paddingSmall,
                                     vertical: 4),
                                 decoration: BoxDecoration(
                                   color: AppConfig.colors.cardBackground,
                                   borderRadius: BorderRadius.circular(AppConfig.metrics.radiusSmall),
                                   border: Border.all(color: AppConfig.colors.cardBorder),
                                 ),
                                 child: Text(
                                   item.subject.toUpperCase(),
                                   style: AppConfig.text.chip,
                                 ),
                               ),
                              _getStatusChip(item.status),
                            ],
                          ),
                          const SizedBox(height: 12),
                           Text(
                             item.title,
                             style: AppConfig.text.heading2,
                           ),
                          const SizedBox(height: 8),
                           Text(
                             item.description,
                             style: AppConfig.text.body,
                           ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                               Icon(Icons.calendar_today_outlined, size: AppConfig.metrics.iconSizeSmall, color: AppConfig.colors.textLight),
                               SizedBox(width: AppConfig.metrics.spacingSmall),
                               Text(
                                 '${AppConfig.strings.dueDatePrefix}${DateFormat('MMM dd, yyyy').format(item.dueDate).toUpperCase()}',
                                 style: AppConfig.text.caption,
                               ),
                              const Spacer(),
                              if (userRole == 'student' && item.status == 'Pending')
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: statusColor,
                                    foregroundColor: AppConfig.colors.textMain,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(horizontal: AppConfig.metrics.spacingDefault, vertical: AppConfig.metrics.spacingSmall),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConfig.metrics.radiusDefault)),
                                  ),
                                  child: Text(AppConfig.strings.submitButton),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: (index * 100).ms).slideY(begin: 0.1, end: 0);
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Submitted':
        return AppConfig.colors.info;
      case 'Evaluated':
        return AppConfig.colors.success;
      default:
        return AppConfig.colors.warning;
    }
  }

  Widget _getStatusChip(String status) {
    final color = _getStatusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        status.toUpperCase(),
        style: AppConfig.text.chip,
      ),
    );
  }
}
