import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:paperup1/modules/exams/presentation/state/exams_provider.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class ResultsPage extends ConsumerStatefulWidget {
  const ResultsPage({super.key});

  @override
  ConsumerState<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends ConsumerState<ResultsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final user = ref.read(authProvider).user;
      if (user != null) {
        ref.read(resultsProvider.notifier).fetchResults(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final resultsState = ref.watch(resultsProvider);

    return Scaffold(
      body: Column(
        children: [
          LiquidHeader(
            title: AppUIConfig.strings.resultsTitle,
            subtitle: AppUIConfig.strings.resultsSubtitle,
          ),
          Expanded(
            child: resultsState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('${AppUIConfig.strings.errorPrefix} $err')),
              data: (results) {
                return ListView.separated(
                  padding: AppUIConfig.components.pagePadding,
                  itemCount: results.length,
                  separatorBuilder: (context, index) => SizedBox(height: AppUIConfig.metrics.spacingLarge),
                  itemBuilder: (context, index) {
                    final result = results[index];
                    final gradeColor = _getGradeColor(result.grade);

                    return GlassContainer(
                      padding: AppUIConfig.components.cardPadding,
                      border: Border.all(color: gradeColor.withOpacity(0.3), width: 1.5),
                      child: Row(
                        children: [
                          Container(
                            height: 64.s,
                            width: 64.s,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [gradeColor, gradeColor.withOpacity(0.7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: AppUIConfig.components.containerRadius,
                              boxShadow: [
                                BoxShadow(
                                  color: gradeColor.withOpacity(0.4),
                                  blurRadius: 25.s,
                                  spreadRadius: -8.s,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                result.grade,
                                style: AppUIConfig.text.heading2.copyWith(fontSize: 28.s),
                              ),
                            ),
                          ),
                          SizedBox(width: AppUIConfig.metrics.spacingLarge),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.exam.subject,
                                  style: AppUIConfig.text.heading3,
                                ),
                                SizedBox(height: AppUIConfig.metrics.spacingTiny),
                                Text(
                                  result.exam.title,
                                  style: AppUIConfig.text.body,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${result.marksObtained.toInt()}',
                                style: AppUIConfig.text.heading2.copyWith(fontSize: 22.s, letterSpacing: -1.s),
                              ),
                              Text(
                                '/${result.maxMarks.toInt()}',
                                style: AppUIConfig.text.caption.copyWith(
                                  fontSize: 12.s,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: (index * 80).ms).slideY(begin: 0.1, end: 0);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    if (grade.startsWith('A')) return AppUIConfig.colors.success;
    if (grade.startsWith('B')) return AppUIConfig.colors.info;
    if (grade.startsWith('C')) return AppUIConfig.colors.warning;
    return AppUIConfig.colors.danger;
  }
}
