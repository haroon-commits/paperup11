import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/modules/student_profile/presentation/state/student_profile_providers.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class FineTab extends ConsumerWidget {
  const FineTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finesAsync = ref.watch(finesProvider);

    return finesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (fines) => SingleChildScrollView(
        padding: AppUIConfig.components.pagePadding,
        child: Column(
          children: [
            _buildFinesHeader(),
            SizedBox(height: AppUIConfig.metrics.spacingDefault),
            _buildFinesTable(fines),
            SizedBox(height: 80.s),
          ],
        ),
      ),
    );
  }

  Widget _buildFinesHeader() {
    return Row(
      children: [
        Icon(Icons.money_off_csred_outlined, color: AppUIConfig.colors.danger, size: 24.s),
        SizedBox(width: AppUIConfig.metrics.spacingSmall),
        Text('Student Fines', style: AppUIConfig.text.heading3),
      ],
    );
  }

  Widget _buildFinesTable(List<dynamic> fines) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double minTableWidth = 477.s; // Columns (440) + Padding (32) + Buffer (5)
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
                        Expanded(flex: 3, child: Text('Fine Type', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 2, child: Text('Amount (Rs.)', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 2, child: Text('Date', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 2, child: Text('Status', textAlign: TextAlign.right, style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                      ],
                    ),
                  ),
                  // Table Rows
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: fines.length,
                    separatorBuilder: (context, index) => Divider(height: 1.s, color: AppUIConfig.colors.divider),
                    itemBuilder: (context, index) {
                      final fine = fines[index];
                      final isPaid = fine.status.toLowerCase() == 'paid';
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.s, vertical: 16.s),
                        child: Row(
                          children: [
                            Expanded(flex: 3, child: Text(fine.fineType, style: AppUIConfig.text.bodyBright.copyWith(color: _getFineTypeColor(fine.fineType)))),
                            Expanded(flex: 2, child: Text(fine.amount.toStringAsFixed(0), style: AppUIConfig.text.bodySemiBold)),
                            Expanded(flex: 2, child: Text(fine.date, style: AppUIConfig.text.body.copyWith(fontSize: 12.s))),
                            Expanded(
                              flex: 2, 
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: _buildStatusChip(fine.status, isPaid),
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

  Color _getFineTypeColor(String type) {
    if (type.contains('Late')) return AppUIConfig.colors.warning;
    if (type.contains('Uniform')) return Colors.tealAccent;
    if (type.contains('Discipline')) return AppUIConfig.colors.danger;
    return AppUIConfig.colors.textMain;
  }

  Widget _buildStatusChip(String status, bool isPaid) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.s, vertical: 4.s),
      decoration: BoxDecoration(
        color: (isPaid ? AppUIConfig.colors.success : AppUIConfig.colors.danger).withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusPill),
        border: Border.all(color: (isPaid ? AppUIConfig.colors.success : AppUIConfig.colors.danger).withOpacity(0.5)),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppUIConfig.text.chip.copyWith(
          color: isPaid ? AppUIConfig.colors.success : AppUIConfig.colors.danger,
          fontSize: 9.s,
        ),
      ),
    );
  }
}
