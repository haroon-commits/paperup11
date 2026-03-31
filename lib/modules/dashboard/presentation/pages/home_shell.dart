import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:go_router/go_router.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class HomeShell extends StatelessWidget {
  final Widget child;

  const HomeShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;

    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: AppUIConfig.metrics.paddingLarge,
          left: AppUIConfig.metrics.paddingLarge,
          right: AppUIConfig.metrics.paddingLarge,
        ),
        child: GlassContainer(
          height: 75,
          borderRadius: BorderRadius.circular(AppUIConfig.metrics.radiusLarge),
          blur: 24,
          padding: EdgeInsets.symmetric(horizontal: AppUIConfig.metrics.paddingTiny),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.grid_view_rounded,
                isActive: location == '/dashboard',
                onTap: () => context.go('/dashboard'),
              ),
              _NavBarItem(
                icon: Icons.calendar_today_rounded,
                isActive: location == '/attendance',
                onTap: () => context.go('/attendance'),
              ),
              _NavBarItem(
                icon: Icons.notifications_rounded,
                isActive: location == '/messages',
                onTap: () => context.go('/messages'),
              ),
              _NavBarItem(
                icon: Icons.person_rounded,
                isActive: location == '/profile',
                onTap: () => context.go('/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final design = Theme.of(context).design;

    return InkWell(
      onTap: onTap,
      borderRadius: AppUIConfig.components.inputRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: AppUIConfig.metrics.paddingTiny),
        decoration: BoxDecoration(
          gradient: isActive
              ? LinearGradient(
                  colors: [design.primary.withOpacity(0.2), design.primary.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: AppUIConfig.components.inputRadius,
          border: isActive ? Border.all(color: design.primary.withOpacity(0.3), width: 1.5) : null,
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: design.primary.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: -5,
                  )
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: isActive ? design.primary : AppUIConfig.colors.textLight.withOpacity(0.4),
          size: AppUIConfig.metrics.iconSizeLarge,
        ),
      ),
    );
  }
}
