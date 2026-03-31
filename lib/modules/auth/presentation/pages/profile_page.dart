import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    return Scaffold(
      body: Column(
        children: [
          LiquidHeader(
            title: AppUIConfig.strings.profileTitle,
            subtitle: user?.role.toUpperCase() ?? 'USER',
            height: 220,
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: AppUIConfig.colors.white.withOpacity(0.2),
              child: Icon(Icons.person, color: AppUIConfig.colors.white, size: 30),
            ),
          ),
          Expanded(
            child: ListView(
              padding: AppUIConfig.components.pagePadding,
              children: [
                _buildSection(context, AppUIConfig.strings.profileAccountSettings, [
                  _ProfileItem(icon: Icons.person_outline, label: AppUIConfig.strings.personalInfo, onTap: () {}),
                  _ProfileItem(icon: Icons.lock_outline, label: AppUIConfig.strings.privacySecurity, onTap: () {}),
                  _ProfileItem(icon: Icons.notifications_none, label: AppUIConfig.strings.notificationSettings, onTap: () {}),
                ]),
                SizedBox(height: AppUIConfig.metrics.spacingLarge),
                _buildSection(context, AppUIConfig.strings.profileAppPreferences, [
                  _ProfileItem(icon: Icons.palette_outlined, label: AppUIConfig.strings.themeCustomization, onTap: () => context.go('/theme-settings')),
                  _ProfileItem(icon: Icons.language, label: AppUIConfig.strings.languageSetting, onTap: () {}),
                  _ProfileItem(icon: Icons.help_outline, label: AppUIConfig.strings.helpSupport, onTap: () {}),
                ]),
                SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () => ref.read(authProvider.notifier).logout(),
                    icon: Icon(Icons.logout, color: AppUIConfig.colors.danger),
                    label: Text(AppUIConfig.strings.signOut, style: AppUIConfig.text.bodySemiBold.copyWith(color: AppUIConfig.colors.danger)),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppUIConfig.components.inputRadius,
                        side: BorderSide(color: AppUIConfig.colors.danger.withOpacity(0.2)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            title,
            style: AppUIConfig.text.caption.copyWith(
              fontSize: 14,
              color: AppUIConfig.colors.white.withOpacity(0.5),
              letterSpacing: 1,
            ),
          ),
        ),
        GlassContainer(
          padding: EdgeInsets.zero,
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppUIConfig.colors.white.withOpacity(0.8), size: 22),
      title: Text(
        label,
        style: AppUIConfig.text.bodySemiBold.copyWith(
          fontSize: 15,
          color: AppUIConfig.colors.white,
          shadows: [
            Shadow(
              color: AppUIConfig.colors.shadowDark,
              blurRadius: 2,
            ),
          ],
        ),
      ),
      trailing: Icon(Icons.chevron_right, size: 18, color: AppUIConfig.colors.textLight),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}
