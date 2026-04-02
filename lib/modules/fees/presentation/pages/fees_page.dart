import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:paperup1/modules/fees/presentation/state/fees_provider.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class FeesPage extends ConsumerStatefulWidget {
  const FeesPage({super.key});

  @override
  ConsumerState<FeesPage> createState() => _FeesPageState();
}

class _FeesPageState extends ConsumerState<FeesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final user = ref.read(authProvider).user;
      if (user != null) {
        ref.read(feesProvider.notifier).fetchFees(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final feesState = ref.watch(feesProvider);

    return Scaffold(
      body: Column(
        children: [
          _buildPremiumHeader(feesState),
          Expanded(
            child: feesState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('${AppUIConfig.strings.errorPrefix} $err')),
              data: (fees) {
                return ListView.separated(
                  padding: AppUIConfig.components.pagePadding,
                  itemCount: fees.length,
                  separatorBuilder: (context, index) => SizedBox(height: AppUIConfig.metrics.spacingDefault),
                  itemBuilder: (context, index) {
                    final fee = fees[index];
                    return _buildFeeCard(context, fee).animate().fadeIn(delay: (index * 50).ms).slideX(begin: 0.1, end: 0);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumHeader(AsyncValue<List<dynamic>> state) {
    final totalDues = state.whenOrNull(
          data: (fees) => fees
              .where((f) => f.status != 'Paid')
              .fold(0.0, (sum, f) => sum + f.amount),
        ) ?? 0.0;

    return Container(
      width: double.infinity,
      height: 240.s,
      decoration: BoxDecoration(
        gradient: Theme.of(context).design.liquidGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppUIConfig.metrics.radiusExtraLarge),
          bottomRight: Radius.circular(AppUIConfig.metrics.radiusExtraLarge),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppUIConfig.metrics.paddingLarge, 
            vertical: AppUIConfig.metrics.paddingDefault
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: AppUIConfig.colors.textMain, size: AppUIConfig.metrics.iconSizeDefault),
                    onPressed: () => context.pop(),
                  ),
                  Text(
                    AppUIConfig.strings.feesTitle,
                    style: AppUIConfig.text.heading3,
                  ),
                  SizedBox(width: 48.s),
                ],
              ),
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    left: 20.s,
                    top: 20.s,
                    child: Container(
                      width: 120.s,
                      height: 120.s,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppUIConfig.colors.glassHighlight,
                            blurRadius: 50.s,
                            spreadRadius: 10.s,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppUIConfig.strings.availableBalance,
                        style: AppUIConfig.text.caption.copyWith(letterSpacing: 2),
                      ),
                      SizedBox(height: AppUIConfig.metrics.spacingSmall),
                      Text(
                        '\$${totalDues.toStringAsFixed(2)}',
                        style: AppUIConfig.text.fontBase.copyWith(
                          color: AppUIConfig.colors.textMain,
                          fontSize: 44.s,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.s,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeeCard(BuildContext context, dynamic fee) {
    final isPaid = fee.status == 'Paid';
    final accentColor = isPaid ? AppUIConfig.colors.success : AppUIConfig.colors.warning;
    final design = Theme.of(context).design;

    return GlassContainer(
      padding: AppUIConfig.components.cardPadding,
      color: accentColor.withOpacity(0.05),
      border: Border.all(color: accentColor.withOpacity(0.2), width: 1.5),
      child: Row(
        children: [
          Container(
            height: 54.s,
            width: 54.s,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppUIConfig.components.inputRadius,
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.3),
                  blurRadius: 12.s,
                  offset: Offset(0, 4.s),
                ),
              ],
            ),
            child: Icon(
              isPaid ? Icons.check_circle_rounded : Icons.pending_rounded,
              color: AppUIConfig.colors.white,
              size: 26.s,
            ),
          ),
          SizedBox(width: AppUIConfig.metrics.spacingDefault),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fee.title,
                  style: AppUIConfig.text.heading2.copyWith(fontSize: 18.s),
                ),
                SizedBox(height: AppUIConfig.metrics.spacingTiny),
                Text(
                  isPaid
                      ? '${AppUIConfig.strings.paidOnPrefix}${DateFormat('MMM dd, yyyy').format(fee.paymentDate!).toUpperCase()}'
                      : '${AppUIConfig.strings.dueByPrefix}${DateFormat('MMM dd, yyyy').format(fee.dueDate).toUpperCase()}',
                  style: AppUIConfig.text.caption,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${fee.amount.toStringAsFixed(0)}',
                style: AppUIConfig.text.heading2.copyWith(fontSize: 22.s),
              ),
              if (!isPaid)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppUIConfig.metrics.paddingSmall, 
                    vertical: 2
                  ),
                  decoration: BoxDecoration(
                    color: design.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    AppUIConfig.strings.payNow.toUpperCase(),
                    style: AppUIConfig.text.chip.copyWith(
                      color: design.primary,
                      fontSize: 10.s,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
