import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final announcements = [
      {
        'title': 'School Reopening Notice',
        'content': 'School will remain closed on Monday due to public holiday.',
        'date': DateTime.now().subtract(const Duration(days: 1)),
        'sender': 'Principal Office',
        'category': 'Holiday'
      },
      {
        'title': 'Annual Sports Day',
        'content': 'Registration is now open for the annual sports meet next month.',
        'date': DateTime.now().subtract(const Duration(days: 3)),
        'sender': 'Sports Dept',
        'category': 'Event'
      },
      {
        'title': 'Fee Payment Reminder',
        'content': 'Please ensure all outstanding fees are settled by the 10th.',
        'date': DateTime.now().subtract(const Duration(days: 5)),
        'sender': 'Accounts Office',
        'category': 'Accounts'
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const LiquidHeader(
            title: 'Notifications',
            subtitle: 'Latest Updates',
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(AppUIConfig.defaultPadding),
              itemCount: announcements.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = announcements[index];
                final category = item['category'] as String;

                return GlassContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategoryBadge(category),
                          Text(
                            DateFormat('MMM dd, hh:mm a').format(item['date'] as DateTime),
                            style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['title'] as String,
                        style: AppUIConfig.primaryFont.copyWith(
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
                      const SizedBox(height: 6),
                      Text(
                        item['content'] as String,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          height: 1.4,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                            child: Icon(Icons.school, size: 12, color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item['sender'] as String,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.1, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge(String category) {
    Color color;
    switch (category) {
      case 'Holiday':
        color = Colors.red;
        break;
      case 'Event':
        color = Colors.blue;
        break;
      default:
        color = Colors.orange;
    }

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
        category.toUpperCase(),
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
