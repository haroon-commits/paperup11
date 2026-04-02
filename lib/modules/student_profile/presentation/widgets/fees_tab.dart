import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/modules/student_profile/presentation/state/student_profile_providers.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class FeesTab extends ConsumerWidget {
  const FeesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feesAsync = ref.watch(feesProvider);

    return feesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (records) => SingleChildScrollView(
        padding: AppUIConfig.components.pagePadding,
        child: Column(
          children: [
            _buildSection(
              title: 'Collect Fee (View Only)',
              icon: Icons.payments_outlined,
              child: _buildCollectFeeForm(),
            ),
            SizedBox(height: AppUIConfig.metrics.spacingLarge),
            _buildSection(
              title: 'Fee Payment History',
              icon: Icons.history_outlined,
              child: _buildFeeHistoryTable(records),
            ),
            SizedBox(height: 80.s),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required IconData icon, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppUIConfig.colors.info, size: 24.s),
            SizedBox(width: AppUIConfig.metrics.spacingSmall),
            Text(title, style: AppUIConfig.text.heading3),
          ],
        ),
        SizedBox(height: AppUIConfig.metrics.spacingDefault),
        child,
      ],
    );
  }

  Widget _buildCollectFeeForm() {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReadOnlyField('Fee Type', 'Monthly Fee'),
          SizedBox(height: AppUIConfig.metrics.spacingDefault),
          _buildReadOnlyField('Amount (Rs.)', '5000'),
          SizedBox(height: AppUIConfig.metrics.spacingDefault),
          _buildReadOnlyField('Payment Date', '05/03/2024'),
          SizedBox(height: 24.s),
          Center(
            child: Text(
              'Fee collection is disabled in profile view.',
              style: AppUIConfig.text.caption.copyWith(
                color: AppUIConfig.colors.textMuted,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppUIConfig.text.caption),
        SizedBox(height: 8.s),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.s, vertical: 12.s),
          decoration: BoxDecoration(
            color: AppUIConfig.colors.cardBackground,
            borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusDefault),
            border: Border.all(color: AppUIConfig.colors.divider),
          ),
          child: Text(value, style: AppUIConfig.text.bodySemiBold.copyWith(color: AppUIConfig.colors.textLight)),
        ),
      ],
    );
  }

  Widget _buildFeeHistoryTable(List<dynamic> records) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double minTableWidth = 547.s; // Columns (510) + Padding (32) + Buffer (5)
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
                        Expanded(flex: 4, child: Text('Month', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Amount', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Date', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 4, child: Text('Receipt #', style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                        Expanded(flex: 3, child: Text('Status', textAlign: TextAlign.right, style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textMuted))),
                      ],
                    ),
                  ),
                  // Table Rows
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: records.length,
                    separatorBuilder: (context, index) => Divider(height: 1.s, color: AppUIConfig.colors.divider),
                    itemBuilder: (context, index) {
                      final record = records[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.s, vertical: 16.s),
                        child: Row(
                          children: [
                            Expanded(flex: 4, child: Text(record.month, style: AppUIConfig.text.bodySemiBold)),
                            Expanded(flex: 3, child: Text(record.amount.toStringAsFixed(0), style: AppUIConfig.text.bodyBright)),
                            Expanded(flex: 3, child: Text(record.date, style: AppUIConfig.text.body.copyWith(fontSize: 12.s))),
                            Expanded(flex: 4, child: Text(record.receiptNumber, style: AppUIConfig.text.body.copyWith(fontSize: 12.s))),
                            Expanded(
                              flex: 3, 
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: _buildStatusChip(record.status),
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

  Widget _buildStatusChip(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.s, vertical: 4.s),
      decoration: BoxDecoration(
        color: AppUIConfig.colors.success.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusPill),
        border: Border.all(color: AppUIConfig.colors.success.withOpacity(0.5)),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppUIConfig.text.chip.copyWith(
          color: AppUIConfig.colors.success,
          fontSize: 9.s,
        ),
      ),
    );
  }
}
