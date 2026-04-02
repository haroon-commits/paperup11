import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/modules/dashboard/presentation/widgets/kpi_card.dart';
import 'package:paperup1/modules/dashboard/presentation/widgets/quick_action_grid.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:intl/intl.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/common_widgets/page_background.dart';
import 'package:paperup1/common_widgets/school_brand_widget.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final role = user?.role ?? 'student';
    final design = Theme.of(context).design;

    return Scaffold(
      backgroundColor: AppUIConfig.colors.transparent,
      body: PageBackground(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GlassContainer(
                borderRadius: AppUIConfig.components.bottomSheetRadius,
                padding: EdgeInsets.fromLTRB(
                  AppUIConfig.metrics.paddingLarge, 
                  AppUIConfig.metrics.paddingDefault, 
                  AppUIConfig.metrics.paddingLarge, 
                  AppUIConfig.metrics.paddingLarge
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // School logo + name
                        SchoolBrandWidget(
                          logoSize: 40.s,
                          direction: Axis.horizontal,
                        ),
                        // Date + avatar
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildAvatar(context, user?.avatarUrl),
                            SizedBox(height: AppUIConfig.metrics.spacingTiny),
                            Text(
                              DateFormat('EEEE, d MMM').format(DateTime.now()),
                              style: AppUIConfig.text.caption.copyWith(
                                color: AppUIConfig.colors.textLight,
                                fontSize: 11.s,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
                    _buildWelcomeSection(user?.name),
                  ],
                ),
              ).animate().slideY(begin: -0.2, end: 0, curve: Curves.easeOutBack),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: AppUIConfig.components.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppUIConfig.strings.quickStats,
                      style: AppUIConfig.text.heading3.copyWith(color: AppUIConfig.colors.white),
                    ).animate().fadeIn(delay: 200.ms),
                    SizedBox(height: AppUIConfig.metrics.spacingDefault),
                    SizedBox(
                      height: 160.s,
                      child: Row(
                        children: [
                          Expanded(
                            child: KPICard(
                              title: AppUIConfig.strings.attendance,
                              value: '94%',
                              icon: Icons.calendar_today_rounded,
                              color: design.primary,
                            ),
                          ),
                          SizedBox(width: AppUIConfig.metrics.spacingDefault),
                          Expanded(
                            child: KPICard(
                              title: role == 'teacher' ? AppUIConfig.strings.classes : AppUIConfig.strings.feesDue,
                              value: role == 'teacher' ? '6' : '\$450',
                              icon: role == 'teacher' ? Icons.class_rounded : Icons.account_balance_wallet_rounded,
                              color: AppUIConfig.colors.warning,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
                    Text(
                      AppUIConfig.strings.quickActions,
                      style: AppUIConfig.text.heading3.copyWith(color: AppUIConfig.colors.white),
                    ).animate().fadeIn(delay: 400.ms),
                    SizedBox(height: AppUIConfig.metrics.spacingDefault),
                    QuickActionGrid(actions: _getRoleActions(context, role)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<QuickActionItem> _getRoleActions(BuildContext context, String role) {
    if (role == 'teacher') {
      return [
        QuickActionItem(label: AppUIConfig.strings.markAttendance, icon: Icons.check_circle_outline, onTap: () => context.push('/attendance')),
        QuickActionItem(label: AppUIConfig.strings.uploadHomework, icon: Icons.upload_file, onTap: () => context.push('/homework')),
        QuickActionItem(label: AppUIConfig.strings.enterMarks, icon: Icons.grade, onTap: () => context.push('/results')),
        QuickActionItem(label: AppUIConfig.strings.syllabus, icon: Icons.book, onTap: () => context.push('/messages')),
      ];
    } else if (role == 'parent') {
      return [
        QuickActionItem(label: AppUIConfig.strings.attendance, icon: Icons.calendar_month, onTap: () => context.push('/attendance')),
        QuickActionItem(label: AppUIConfig.strings.feesTitle, icon: Icons.receipt_long, onTap: () => context.push('/fees')),
        QuickActionItem(label: AppUIConfig.strings.resultsTitle, icon: Icons.poll, onTap: () => context.push('/results')),
        QuickActionItem(label: AppUIConfig.strings.messages, icon: Icons.chat_bubble_outline, onTap: () => context.push('/messages')),
      ];
    } else {
      return [
        QuickActionItem(label: AppUIConfig.strings.attendance, icon: Icons.calendar_month, onTap: () => context.push('/attendance')),
        QuickActionItem(label: AppUIConfig.strings.homeworkTitle, icon: Icons.home_work, onTap: () => context.push('/homework')),
        QuickActionItem(label: AppUIConfig.strings.resultsTitle, icon: Icons.poll, onTap: () => context.push('/results')),
        QuickActionItem(label: AppUIConfig.strings.timetableTitle, icon: Icons.schedule, onTap: () => context.push('/timetable')),
      ];
    }
  }

  Widget _buildAvatar(BuildContext context, String? url) {
    return InkWell(
      onTap: () => context.push('/student-profile'),
      borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusPill),
      child: Container(
        padding: const EdgeInsets.all(2), // extra spacing for the tap effect
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppUIConfig.colors.cardBorder, width: 2),
        ),
        child: CircleAvatar(
          radius: AppUIConfig.metrics.radiusLarge,
          backgroundImage: NetworkImage(url ?? 'https://ui-avatars.com/api/?name=User&background=random&color=fff'),
          onBackgroundImageError: (_, __) {},
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(String? name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppUIConfig.strings.goodMorning,
          style: AppUIConfig.text.body.copyWith(
            color: AppUIConfig.colors.textMain.withOpacity(0.8), 
            fontSize: 16.s
          ),
        ),
        Text(
          name ?? AppUIConfig.strings.fallbackStudentName,
          style: AppUIConfig.text.heading1.copyWith(
            color: AppUIConfig.colors.textMain, 
            fontSize: 32.s
          ),
        ),
      ],
    );
  }
}
