import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/modules/homework/presentation/state/homework_provider.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
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
      backgroundColor: AppUIConfig.colors.transparent,
      body: PageBackground(
        child: Column(
        children: [
             LiquidHeader(
            title: AppUIConfig.strings.homeworkTitle,
            subtitle: AppUIConfig.strings.homeworkSubtitle,
            trailing: userRole == 'teacher'
                ? IconButton(
                    icon: Icon(Icons.add_task, color: AppUIConfig.colors.textMain, size: AppUIConfig.metrics.iconSizeLarge),
                    onPressed: () {},
                  )
                : null,
             ), 
             Expanded(
            child: homeworkState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('${AppUIConfig.strings.errorPrefix} $err')),
              data: (assignments) {
                return ListView.separated(
                  padding: AppUIConfig.components.pagePadding,
                  itemCount: assignments.length,
                  separatorBuilder: (context, index) => SizedBox(height: AppUIConfig.metrics.spacingDefault),
                  itemBuilder: (context, index) {
                    final item = assignments[index];
                    final statusColor = _getStatusColor(item.status);

                    return GlassContainer(
                      padding: AppUIConfig.components.cardPadding,
                      border: Border.all(color: statusColor.withOpacity(0.3), width: 1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Container(
                                 padding: EdgeInsets.symmetric(
                                     horizontal: AppUIConfig.metrics.paddingSmall,
                                     vertical: 4),
                                 decoration: BoxDecoration(
                                   color: AppUIConfig.colors.cardBackground,
                                   borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusSmall),
                                   border: Border.all(color: AppUIConfig.colors.cardBorder),
                                 ),
                                 child: Text(
                                   item.subject.toUpperCase(),
                                   style: AppUIConfig.text.chip,
                                 ),
                               ),
                              _getStatusChip(item.status),
                            ],
                          ),
                          SizedBox(height: AppUIConfig.metrics.spacingSmall),
                           Text(
                             item.title,
                             style: AppUIConfig.text.heading2,
                           ),
                          SizedBox(height: AppUIConfig.metrics.spacingSmall),
                           Text(
                             item.description,
                             style: AppUIConfig.text.body,
                           ),
                          SizedBox(height: AppUIConfig.metrics.spacingDefault),
                          Row(
                            children: [
                               Icon(Icons.calendar_today_outlined, size: AppUIConfig.metrics.iconSizeSmall, color: AppUIConfig.colors.textLight),
                               SizedBox(width: AppUIConfig.metrics.spacingSmall),
                               Text(
                                 '${AppUIConfig.strings.dueDatePrefix}${DateFormat('MMM dd, yyyy').format(item.dueDate).toUpperCase()}',
                                 style: AppUIConfig.text.caption,
                               ),
                              const Spacer(),
                              if (userRole == 'student' && item.status == 'Pending')
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: statusColor,
                                    foregroundColor: AppUIConfig.colors.textMain,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(horizontal: AppUIConfig.metrics.spacingDefault, vertical: AppUIConfig.metrics.spacingTiny),
                                    shape: RoundedRectangleBorder(borderRadius: AppUIConfig.components.inputRadius),
                                  ),
                                  child: Text(AppUIConfig.strings.submitButton),
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
        return AppUIConfig.colors.info;
      case 'Evaluated':
        return AppUIConfig.colors.success;
      default:
        return AppUIConfig.colors.warning;
    }
  }

  Widget _getStatusChip(String status) {
    final color = _getStatusColor(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppUIConfig.metrics.paddingTiny, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusSmall),
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
        style: AppUIConfig.text.chip,
      ),
    );
  }
}
