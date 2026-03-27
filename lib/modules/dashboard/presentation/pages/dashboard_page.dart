import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/modules/dashboard/presentation/widgets/kpi_card.dart';
import 'package:paperup1/modules/dashboard/presentation/widgets/quick_action_grid.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.transparent,
      body: PageBackground(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GlassContainer(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
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
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat('EEEE, d MMM').format(DateTime.now()),
                              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13, letterSpacing: 0.5),
                            ),
                          ],
                        ),
                        _buildAvatar(user?.avatarUrl),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildWelcomeSection(user?.name),
                  ],
                ),
              ).animate().slideY(begin: -0.2, end: 0, curve: Curves.easeOutBack),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Stats',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: 16),
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
                          const SizedBox(width: 16),
                          Expanded(
                            child: KPICard(
                              title: role == 'teacher' ? 'Classes' : 'Fees Due',
                              value: role == 'teacher' ? '6' : '\$450',
                              icon: role == 'teacher' ? Icons.class_rounded : Icons.account_balance_wallet_rounded,
                              color: const Color(0xFFFF9500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Quick Actions',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 16),
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
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
      child: CircleAvatar(
        radius: 24,
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
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
        ),
        Text(
          name ?? 'Student',
          style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
