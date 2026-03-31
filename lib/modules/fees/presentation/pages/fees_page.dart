import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperup1/modules/fees/presentation/state/fees_provider.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

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
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (fees) {
                return ListView.separated(
                  padding: const EdgeInsets.all(AppUIConfig.defaultPadding),
                  itemCount: fees.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
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
      height: 240,
      decoration: BoxDecoration(
        gradient: Theme.of(context).design.liquidGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: AppConfig.colors.textMain, size: AppConfig.metrics.iconSizeDefault),
                    onPressed: () => context.pop(),
                  ),
                  Text(
                    AppConfig.strings.feesTitle,
                    style: AppConfig.text.heading3,
                  ),
                  SizedBox(width: 48),
                ],
              ),
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppConfig.colors.glassHighlight,
                            blurRadius: 50,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConfig.strings.availableBalance,
                        style: AppConfig.text.caption.copyWith(letterSpacing: 2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${totalDues.toStringAsFixed(2)}',
                        style: AppConfig.text.fontBase.copyWith(
                          color: AppConfig.colors.textMain,
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeeCard(BuildContext context, dynamic fee) {
    final isPaid = fee.status == 'Paid';
    final accentColor = isPaid ? AppConfig.colors.success : AppConfig.colors.warning;
    final design = Theme.of(context).design;

    return GlassContainer(
      padding: const EdgeInsets.all(20),
      color: accentColor.withOpacity(0.05),
      border: Border.all(color: accentColor.withOpacity(0.2), width: 1.5),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              isPaid ? Icons.check_circle_rounded : Icons.pending_rounded,
              color: AppConfig.colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fee.title,
                  style: AppConfig.text.heading2.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  isPaid
                      ? '${AppConfig.strings.paidOnPrefix}${DateFormat('MMM dd, yyyy').format(fee.paymentDate!).toUpperCase()}'
                      : '${AppConfig.strings.dueByPrefix}${DateFormat('MMM dd, yyyy').format(fee.dueDate).toUpperCase()}',
                  style: AppConfig.text.caption,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${fee.amount.toStringAsFixed(0)}',
                style: AppConfig.text.heading2.copyWith(fontSize: 22),
              ),
              if (!isPaid)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: design.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    AppConfig.strings.payNow.toUpperCase(),
                    style: AppConfig.text.chip.copyWith(
                      color: design.primary,
                      fontSize: 10,
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
