import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/modules/student_profile/presentation/state/student_profile_providers.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class ResultsTab extends ConsumerWidget {
  const ResultsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsAsync = ref.watch(resultsProvider);

    return resultsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (results) => SingleChildScrollView(
        padding: AppUIConfig.components.pagePadding,
        child: Column(
          children: [
            _buildResultsHeader(),
            SizedBox(height: AppUIConfig.metrics.spacingDefault),
            _buildResultsTable(results),
            SizedBox(height: 80.s),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsHeader() {
    return Row(
      children: [
        Icon(Icons.assignment_turned_in_outlined, color: AppUIConfig.colors.info, size: 24.s),
        SizedBox(width: AppUIConfig.metrics.spacingSmall),
        Text('Academic Results', style: AppUIConfig.text.heading3),
      ],
    );
  }

  Widget _buildResultsTable(List<dynamic> results) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double minTableWidth = 577.s; // Columns (540) + Padding (32) + Buffer (5)
        final double tableWidth = constraints.maxWidth > minTableWidth ? constraints.maxWidth : minTableWidth;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: tableWidth,
              maxWidth: tableWidth,
            ),
            child: GlassContainer(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  // Table Header
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.s, vertical: 12.s),
                    decoration: BoxDecoration(
                      color: AppUIConfig.colors.cardBackground,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(AppUIConfig.metrics.radiusDefault)),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 5, child: Text('Examination', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Total Marks', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Obtained Marks', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Percentage', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 2, child: Text('Grade', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Status', textAlign: TextAlign.right, style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                      ],
                    ),
                  ),
                  // Table Rows
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: results.length,
                    separatorBuilder: (context, index) => Divider(height: 1.s, color: AppUIConfig.colors.divider),
                    itemBuilder: (context, index) {
                      final result = results[index];
                      final isPass = result.status.toLowerCase() == 'pass';
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.s, vertical: 16.s),
                        child: Row(
                          children: [
                            Expanded(flex: 5, child: Text(result.examination, style: AppUIConfig.text.bodySemiBold)),
                            Expanded(flex: 3, child: Text(result.totalMarks.toString(), style: AppUIConfig.text.bodyBright)),
                            Expanded(flex: 3, child: Text(result.obtainedMarks.toString(), style: AppUIConfig.text.bodyBright)),
                            Expanded(flex: 3, child: Text('${result.percentage}%', style: AppUIConfig.text.bodySemiBold.copyWith(color: AppUIConfig.colors.info))),
                            Expanded(flex: 2, child: Text(result.grade, style: AppUIConfig.text.bodySemiBold.copyWith(color: AppUIConfig.colors.success))),
                            Expanded(
                              flex: 3, 
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: _buildStatusChip(result.status, isPass),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status, bool isPass) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.s, vertical: 4.s),
      decoration: BoxDecoration(
        color: (isPass ? AppUIConfig.colors.success : AppUIConfig.colors.danger).withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusPill),
        border: Border.all(color: (isPass ? AppUIConfig.colors.success : AppUIConfig.colors.danger).withOpacity(0.5)),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppUIConfig.text.chip.copyWith(
          color: isPass ? AppUIConfig.colors.success : AppUIConfig.colors.danger,
          fontSize: 9.s,
        ),
      ),
    );
  }
}
