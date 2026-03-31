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
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PaperUp.',
                              style: AppUIConfig.text.heading1,
                            ),
                            SizedBox(height: AppUIConfig.metrics.spacingTiny),
                            Text(
                              DateFormat('EEEE, d MMM').format(DateTime.now()),
                              style: AppUIConfig.text.caption.copyWith(
                                color: AppUIConfig.colors.textLight,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        _buildAvatar(user?.avatarUrl),
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
                      'Quick Stats',
                      style: AppUIConfig.text.heading3.copyWith(color: AppUIConfig.colors.white),
                    ).animate().fadeIn(delay: 200.ms),
                    SizedBox(height: AppUIConfig.metrics.spacingDefault),
                    SizedBox(
                      height: 160,
                      child: Row(
                        children: [
                          Expanded(
                            child: KPICard(
                              title: 'Attendance',
                              value: '94%',
                              icon: Icons.calendar_today_rounded,
                              color: design.primary,
                            ),
                          ),
                          SizedBox(width: AppUIConfig.metrics.spacingDefault),
                          Expanded(
                            child: KPICard(
                              title: role == 'teacher' ? 'Classes' : 'Fees Due',
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
                      'Quick Actions',
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
        QuickActionItem(label: 'Mark Attendance', icon: Icons.check_circle_outline, onTap: () => context.push('/attendance')),
        QuickActionItem(label: 'Upload Homework', icon: Icons.upload_file, onTap: () => context.push('/homework')),
        QuickActionItem(label: 'Enter Marks', icon: Icons.grade, onTap: () => context.push('/results')),
        QuickActionItem(label: 'Syllabus', icon: Icons.book, onTap: () => context.push('/messages')),
      ];
    } else if (role == 'parent') {
      return [
        QuickActionItem(label: 'Attendance', icon: Icons.calendar_month, onTap: () => context.push('/attendance')),
        QuickActionItem(label: 'Fees', icon: Icons.receipt_long, onTap: () => context.push('/fees')),
        QuickActionItem(label: 'Results', icon: Icons.poll, onTap: () => context.push('/results')),
        QuickActionItem(label: 'Messages', icon: Icons.chat_bubble_outline, onTap: () => context.push('/messages')),
      ];
    } else {
      return [
        QuickActionItem(label: 'Attendance', icon: Icons.calendar_month, onTap: () => context.push('/attendance')),
        QuickActionItem(label: 'Homework', icon: Icons.home_work, onTap: () => context.push('/homework')),
        QuickActionItem(label: 'Results', icon: Icons.poll, onTap: () => context.push('/results')),
        QuickActionItem(label: 'Timetable', icon: Icons.schedule, onTap: () => context.push('/timetable')),
      ];
    }
  }

  Widget _buildAvatar(String? url) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppUIConfig.colors.cardBorder, width: 2),
      ),
      child: CircleAvatar(
        radius: AppUIConfig.metrics.radiusLarge,
        backgroundImage: NetworkImage(url ?? 'https://i.pravatar.cc/150'),
      ),
    );
  }

  Widget _buildWelcomeSection(String? name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning,',
          style: AppUIConfig.text.body.copyWith(
            color: AppUIConfig.colors.textMain.withOpacity(0.8), 
            fontSize: 16
          ),
        ),
        Text(
          name ?? 'Student',
          style: AppUIConfig.text.heading1.copyWith(
            color: AppUIConfig.colors.textMain, 
            fontSize: 32
          ),
        ),
      ],
    );
  }
}
