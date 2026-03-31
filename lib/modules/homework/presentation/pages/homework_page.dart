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
            title: 'Homework',
            subtitle: 'Assignments & Tasks',
            trailing: userRole == 'teacher'
                ? IconButton(
                    icon: const Icon(Icons.add_task, color: Colors.white, size: 28),
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
                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                 decoration: BoxDecoration(
                                   color: Colors.white.withOpacity(0.1),
                                   borderRadius: BorderRadius.circular(8),
                                   border: Border.all(color: Colors.white.withOpacity(0.2)),
                                 ),
                                 child: Text(
                                   item.subject.toUpperCase(),
                                   style: AppUIConfig.primaryFont.copyWith(
                                     fontSize: 10,
                                     fontWeight: FontWeight.w900,
                                     color: Colors.white.withOpacity(0.9),
                                     letterSpacing: 1,
                                   ),
                                 ),
                               ),
                              _getStatusChip(item.status),
                            ],
                          ),
                          const SizedBox(height: 12),
                           Text(
                             item.title,
                             style: AppUIConfig.primaryFont.copyWith(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                               shadows: [
                                 Shadow(
                                   color: Colors.black.withOpacity(0.3),
                                   blurRadius: 4,
                                   offset: const Offset(0, 2),
                                 ),
                               ],
                             ),
                           ),
                          const SizedBox(height: 8),
                           Text(
                             item.description,
                             style: TextStyle(
                               color: Colors.white.withOpacity(0.7),
                               fontSize: 14,
                               height: 1.4,
                               shadows: [
                                 Shadow(
                                   color: Colors.black.withOpacity(0.2),
                                   blurRadius: 2,
                                 ),
                               ],
                             ),
                           ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                               const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.white70),
                               const SizedBox(width: 8),
                               Text(
                                 'DUE: ${DateFormat('MMM dd, yyyy').format(item.dueDate).toUpperCase()}',
                                 style: AppUIConfig.primaryFont.copyWith(
                                   fontSize: 11,
                                   color: Colors.white.withOpacity(0.6),
                                   fontWeight: FontWeight.w900,
                                   letterSpacing: 0.5,
                                 ),
                               ),
                              const Spacer(),
                              if (userRole == 'student' && item.status == 'Pending')
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: statusColor,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  child: const Text('Submit Now'),
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
        return const Color(0xFF007AFF); // Premium Blue
      case 'Evaluated':
        return const Color(0xFF34C759); // Premium Green
      default:
        return const Color(0xFFFF9500); // Premium Orange
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
        style: AppUIConfig.primaryFont.copyWith(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
