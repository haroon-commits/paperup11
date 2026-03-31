import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

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
              padding: AppUIConfig.components.pagePadding,
              itemCount: announcements.length,
              separatorBuilder: (context, index) => SizedBox(height: AppUIConfig.metrics.spacingDefault),
              itemBuilder: (context, index) {
                final item = announcements[index];
                final category = item['category'] as String;

                return GlassContainer(
                  padding: AppUIConfig.components.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategoryBadge(category),
                          Text(
                            DateFormat('MMM dd, hh:mm a').format(item['date'] as DateTime),
                            style: AppUIConfig.text.caption.copyWith(
                              color: AppUIConfig.colors.textMuted,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppUIConfig.metrics.spacingSmall),
                      Text(
                        item['title'] as String,
                        style: AppUIConfig.text.heading3.copyWith(
                          color: AppUIConfig.colors.white,
                          shadows: [
                            Shadow(
                              color: AppUIConfig.colors.shadowDark,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppUIConfig.metrics.spacingTiny),
                      Text(
                        item['content'] as String,
                        style: AppUIConfig.text.bodyBright.copyWith(
                          color: AppUIConfig.colors.white.withOpacity(0.8),
                          shadows: [
                            Shadow(
                              color: AppUIConfig.colors.shadowDark,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppUIConfig.metrics.spacingDefault),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                            child: Icon(Icons.school, size: 12, color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(width: AppUIConfig.metrics.spacingSmall),
                          Text(
                            item['sender'] as String,
                            style: AppUIConfig.text.caption.copyWith(
                              color: AppUIConfig.colors.textMuted,
                            ),
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
        color = AppUIConfig.colors.danger;
        break;
      case 'Event':
        color = AppUIConfig.colors.info;
        break;
      default:
        color = AppUIConfig.colors.warning;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppUIConfig.metrics.paddingTiny, 
        vertical: 4
      ),
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
        category.toUpperCase(),
        style: AppUIConfig.text.chip.copyWith(
          color: AppUIConfig.colors.white,
        ),
      ),
    );
  }
}
