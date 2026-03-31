import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';
import 'package:paperup1/core/theme/state/theme_notifier.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';

class ThemeSettingsPage extends ConsumerWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final role = user?.role ?? 'student';
    final config = ref.watch(themeNotifierProvider)[role] ?? ThemeConfig.studentDefault();

    return Scaffold(
      body: Column(
        children: [
          const LiquidHeader(
            title: 'Appearance',
            subtitle: 'Personalize your experience',
          ),
          Expanded(
            child: ListView(
              padding: AppUIConfig.components.pagePadding,
              children: [
                _buildSectionTitle('Design Style'),
                SizedBox(height: AppUIConfig.metrics.spacingSmall),
                Row(
                  children: [
                    _StyleCard(
                      label: 'Glass',
                      isSelected: config.style == ThemeStyle.glass,
                      icon: Icons.blur_on,
                      onTap: () => _updateStyle(ref, role, config, ThemeStyle.glass),
                    ),
                    SizedBox(width: AppUIConfig.metrics.spacingSmall),
                    _StyleCard(
                      label: 'Neo',
                      isSelected: config.style == ThemeStyle.neo,
                      icon: Icons.layers_outlined,
                      onTap: () => _updateStyle(ref, role, config, ThemeStyle.neo),
                    ),
                    SizedBox(width: AppUIConfig.metrics.spacingSmall),
                    _StyleCard(
                      label: 'Clean',
                      isSelected: config.style == ThemeStyle.minimalist,
                      icon: Icons.check_circle_outline,
                      onTap: () => _updateStyle(ref, role, config, ThemeStyle.minimalist),
                    ),
                  ],
                ),
                SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
                _buildSectionTitle('Primary Color'),
                SizedBox(height: AppUIConfig.metrics.spacingSmall),
                Wrap(
                  spacing: AppUIConfig.metrics.spacingSmall,
                  runSpacing: AppUIConfig.metrics.spacingSmall,
                  children: [
                    _ColorCircle(color: AppUIConfig.colors.info, isSelected: config.primaryColor.value == AppUIConfig.colors.info.value, onTap: () => _updateColor(ref, role, config, AppUIConfig.colors.info)),
                    _ColorCircle(color: AppUIConfig.colors.success, isSelected: config.primaryColor.value == AppUIConfig.colors.success.value, onTap: () => _updateColor(ref, role, config, AppUIConfig.colors.success)),
                    _ColorCircle(color: AppUIConfig.colors.teacherTheme, isSelected: config.primaryColor.value == AppUIConfig.colors.teacherTheme.value, onTap: () => _updateColor(ref, role, config, AppUIConfig.colors.teacherTheme)),
                    _ColorCircle(color: AppUIConfig.colors.warning, isSelected: config.primaryColor.value == AppUIConfig.colors.warning.value, onTap: () => _updateColor(ref, role, config, AppUIConfig.colors.warning)),
                    _ColorCircle(color: AppUIConfig.colors.danger, isSelected: config.primaryColor.value == AppUIConfig.colors.danger.value, onTap: () => _updateColor(ref, role, config, AppUIConfig.colors.danger)),
                    _ColorCircle(color: AppUIConfig.colors.subjectPhysics, isSelected: config.primaryColor.value == AppUIConfig.colors.subjectPhysics.value, onTap: () => _updateColor(ref, role, config, AppUIConfig.colors.subjectPhysics)),
                  ],
                ),
                SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
                _buildSectionTitle('Premium Features'),
                SizedBox(height: AppUIConfig.metrics.spacingSmall),
                GlassContainer(
                  padding: AppUIConfig.components.cardPadding,
                  child: Row(
                    children: [
                      Icon(Icons.auto_awesome, color: AppUIConfig.colors.warning, size: 24),
                      SizedBox(width: AppUIConfig.metrics.spacingDefault),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animated Background',
                              style: AppUIConfig.text.bodySemiBold.copyWith(color: AppUIConfig.colors.white),
                            ),
                            Text(
                              'Top-notch organic liquid effects',
                              style: AppUIConfig.text.caption.copyWith(color: AppUIConfig.colors.textLight),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: config.useAnimatedBackground,
                        onChanged: (val) => _updateAnim(ref, role, config, val),
                        activeColor: config.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: AppUIConfig.text.caption.copyWith(
        fontSize: 12,
        color: AppUIConfig.colors.white.withOpacity(0.5),
        letterSpacing: 1.5,
      ),
    );
  }

  void _updateStyle(WidgetRef ref, String role, ThemeConfig config, ThemeStyle style) {
    ref.read(themeNotifierProvider.notifier).updateTheme(role, config.copyWith(style: style));
  }

  void _updateColor(WidgetRef ref, String role, ThemeConfig config, Color color) {
    ref.read(themeNotifierProvider.notifier).updateTheme(role, config.copyWith(primaryColor: color));
  }

  void _updateAnim(WidgetRef ref, String role, ThemeConfig config, bool useAnim) {
    ref.read(themeNotifierProvider.notifier).updateTheme(role, config.copyWith(useAnimatedBackground: useAnim));
  }
}

class _StyleCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  const _StyleCard({required this.label, required this.isSelected, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: isSelected 
          ? GlassContainer(
              padding: EdgeInsets.symmetric(vertical: 20),
              border: Border.all(color: AppUIConfig.colors.textLight, width: 1.5),
              child: _buildContent(context, true),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: AppUIConfig.colors.white.withOpacity(0.05),
                borderRadius: AppUIConfig.components.containerRadius,
                border: Border.all(color: AppUIConfig.colors.white.withOpacity(0.1)),
              ),
              child: _buildContent(context, false),
            ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool active) {
    return Column(
      children: [
        Icon(icon, color: active ? AppUIConfig.colors.white : AppUIConfig.colors.white.withOpacity(0.3), size: 28),
        SizedBox(height: AppUIConfig.metrics.spacingSmall),
        Text(
          label,
          style: AppUIConfig.text.body.copyWith(
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            color: active ? AppUIConfig.colors.white : AppUIConfig.colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorCircle({required this.color, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: AppUIConfig.colors.white, width: 3) : null,
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: isSelected ? Icon(Icons.check, color: AppUIConfig.colors.white) : null,
      ),
    );
  }
}
