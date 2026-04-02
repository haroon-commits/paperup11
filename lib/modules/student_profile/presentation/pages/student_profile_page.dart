import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/common_widgets/page_background.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/modules/student_profile/presentation/state/student_profile_providers.dart';
import 'package:paperup1/modules/student_profile/presentation/widgets/information_tab.dart';
import 'package:paperup1/modules/student_profile/presentation/widgets/attendance_tab.dart';
import 'package:paperup1/modules/student_profile/presentation/widgets/fine_tab.dart';
import 'package:paperup1/modules/student_profile/presentation/widgets/fees_tab.dart';
import 'package:paperup1/modules/student_profile/presentation/widgets/results_tab.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class StudentProfilePage extends ConsumerWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentInfoAsync = ref.watch(studentInfoProvider);

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageBackground(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: studentInfoAsync.when(
                  loading: () => _buildHeaderPlaceholder(),
                  error: (err, stack) => _buildHeaderError(err.toString()),
                  data: (info) => _buildHeader(info, context),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppUIConfig.colors.info,
                    labelColor: AppUIConfig.colors.textMain,
                    unselectedLabelColor: AppUIConfig.colors.textMuted,
                    labelStyle: AppUIConfig.text.bodySemiBold,
                    tabs: const [
                      Tab(text: 'Information'),
                      Tab(text: 'Attendance'),
                      Tab(text: 'Fine'),
                      Tab(text: 'Fees'),
                      Tab(text: 'Results'),
                      Tab(text: 'Siblings'),
                    ],
                  ),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                InformationTab(),
                AttendanceTab(),
                FineTab(),
                FeesTab(),
                ResultsTab(),
                Center(child: Text('Siblings Feature Coming Soon', style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(dynamic info, BuildContext context) {
    final double avatarRadius = 45.s;
    final double nameFontSize = 28.s;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppUIConfig.metrics.paddingDefault, 
        MediaQuery.of(context).padding.top + 8.s, 
        AppUIConfig.metrics.paddingDefault, 
        24.s
      ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios_new, color: AppUIConfig.colors.textMain, size: 20.s),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 16.s),
              Row(
                children: [
                  // Avatar with adaptive radius
                  Container(
                    padding: EdgeInsets.all(3.s),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppUIConfig.colors.cardBorder, width: 2.s),
                    ),
                    child: CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: NetworkImage(info.avatarUrl ?? ''),
                      backgroundColor: AppUIConfig.colors.cardBackground,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Name and Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                info.fullName,
                                style: AppUIConfig.text.heading1.copyWith(fontSize: nameFontSize),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _buildActiveBadge(info.status),
                          ],
                        ),
                        SizedBox(height: 10.s),
                        // Wrap these in a SingleChildScrollView or Flexible to prevent overflow
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppUIConfig.colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.home_outlined, color: AppUIConfig.colors.info, size: 14.s),
                                    SizedBox(width: 4.s),
                                    Text(
                                      info.classSection ?? '—',
                                      style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMain, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.s),
                              Icon(Icons.badge_outlined, color: AppUIConfig.colors.textMuted, size: 18.s),
                              SizedBox(width: 8.s),
                              Icon(Icons.calendar_today_outlined, color: AppUIConfig.colors.textMuted, size: 18.s),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  Widget _buildActiveBadge(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.s, vertical: 4.s),
      decoration: BoxDecoration(
        color: AppUIConfig.colors.success.withOpacity(0.15),
        borderRadius: BorderRadius.circular(pillRadius),
        border: Border.all(color: AppUIConfig.colors.success.withOpacity(0.3)),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppUIConfig.text.chip.copyWith(
          color: AppUIConfig.colors.success, 
          fontSize: 9.s,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5.s,
        ),
      ),
    );
  }

  static double get pillRadius => 999;

  Widget _buildHeaderPlaceholder() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildHeaderError(String error) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text('Error loading profile: $error', style: const TextStyle(color: Colors.red)),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black.withOpacity(0.8), // Dark background for sticky tabs
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
