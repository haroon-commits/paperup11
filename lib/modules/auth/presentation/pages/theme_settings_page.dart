import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';
import 'package:paperup1/core/theme/state/theme_notifier.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/common_widgets/neo_container.dart';
import 'package:google_fonts/google_fonts.dart';
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
              padding: const EdgeInsets.all(24),
              children: [
                _buildSectionTitle('Design Style'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _StyleCard(
                      label: 'Glass',
                      isSelected: config.style == ThemeStyle.glass,
                      icon: Icons.blur_on,
                      onTap: () => _updateStyle(ref, role, config, ThemeStyle.glass),
                    ),
                    const SizedBox(width: 12),
                    _StyleCard(
                      label: 'Neo',
                      isSelected: config.style == ThemeStyle.neo,
                      icon: Icons.layers_outlined,
                      onTap: () => _updateStyle(ref, role, config, ThemeStyle.neo),
                    ),
                    const SizedBox(width: 12),
                    _StyleCard(
                      label: 'Clean',
                      isSelected: config.style == ThemeStyle.minimalist,
                      icon: Icons.check_circle_outline,
                      onTap: () => _updateStyle(ref, role, config, ThemeStyle.minimalist),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildSectionTitle('Primary Color'),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _ColorCircle(color: const Color(0xFF007AFF), isSelected: config.primaryColor.value == 0xFF007AFF, onTap: () => _updateColor(ref, role, config, const Color(0xFF007AFF))),
                    _ColorCircle(color: const Color(0xFF34C759), isSelected: config.primaryColor.value == 0xFF34C759, onTap: () => _updateColor(ref, role, config, const Color(0xFF34C759))),
                    _ColorCircle(color: const Color(0xFFAF52DE), isSelected: config.primaryColor.value == 0xFFAF52DE, onTap: () => _updateColor(ref, role, config, const Color(0xFFAF52DE))),
                    _ColorCircle(color: const Color(0xFFFF9500), isSelected: config.primaryColor.value == 0xFFFF9500, onTap: () => _updateColor(ref, role, config, const Color(0xFFFF9500))),
                    _ColorCircle(color: const Color(0xFFFF2D55), isSelected: config.primaryColor.value == 0xFFFF2D55, onTap: () => _updateColor(ref, role, config, const Color(0xFFFF2D55))),
                    _ColorCircle(color: const Color(0xFF5856D6), isSelected: config.primaryColor.value == 0xFF5856D6, onTap: () => _updateColor(ref, role, config, const Color(0xFF5856D6))),
                  ],
                ),
                const SizedBox(height: 32),
                _buildSectionTitle('Premium Features'),
                const SizedBox(height: 12),
                GlassContainer(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.auto_awesome, color: Colors.amber, size: 24),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animated Background',
                              style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              'Top-notch organic liquid effects',
                              style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5)),
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
      style: GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.white.withOpacity(0.5),
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
              padding: const EdgeInsets.symmetric(vertical: 20),
              border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
              child: _buildContent(context, true),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: _buildContent(context, false),
            ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool active) {
    return Column(
      children: [
        Icon(icon, color: active ? Colors.white : Colors.white.withOpacity(0.3), size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            color: active ? Colors.white : Colors.white.withOpacity(0.4),
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
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: isSelected ? const Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}
