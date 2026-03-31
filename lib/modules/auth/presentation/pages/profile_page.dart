import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/common_widgets/liquid_header.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    return Scaffold(
      body: Column(
        children: [
          LiquidHeader(
            title: 'Profile',
            subtitle: user?.role.toUpperCase() ?? 'USER',
            height: 220,
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(Icons.person, color: Colors.white, size: 30),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppUIConfig.defaultPadding),
              children: [
                _buildSection(context, 'Account Settings', [
                  _ProfileItem(icon: Icons.person_outline, label: 'Personal Information', onTap: () {}),
                  _ProfileItem(icon: Icons.lock_outline, label: 'Privacy & Security', onTap: () {}),
                  _ProfileItem(icon: Icons.notifications_none, label: 'Notification Settings', onTap: () {}),
                ]),
                const SizedBox(height: 24),
                _buildSection(context, 'App Preferences', [
                  _ProfileItem(icon: Icons.palette_outlined, label: 'Theme Customization', onTap: () => context.go('/theme-settings')),
                  _ProfileItem(icon: Icons.language, label: 'Language (English)', onTap: () {}),
                  _ProfileItem(icon: Icons.help_outline, label: 'Help & Support', onTap: () {}),
                ]),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () => ref.read(authProvider.notifier).logout(),
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: const Text('Sign Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.red.withOpacity(0.2)),
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
            style: AppUIConfig.primaryFont.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white.withOpacity(0.5),
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
      leading: Icon(icon, color: Colors.white.withOpacity(0.8), size: 22),
      title: Text(
        label,
        style: AppUIConfig.primaryFont.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
            ),
          ],
        ),
      ),
      trailing: Icon(Icons.chevron_right, size: 18, color: Colors.white.withOpacity(0.4)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}
