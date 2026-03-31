import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key, this.location});

  final String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppUIConfig.metrics.paddingLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppUIConfig.strings.error404,
                style: AppUIConfig.text.heading1.copyWith(fontSize: 48),
              ),
              SizedBox(height: AppUIConfig.metrics.spacingSmall),
              Text(
                AppUIConfig.strings.pageNotFound,
                style: AppUIConfig.text.heading2.copyWith(fontSize: 20),
              ),
              if (location != null) ...[
                SizedBox(height: AppUIConfig.metrics.spacingTiny),
                Text(
                  'No route exists for: $location',
                  textAlign: TextAlign.center,
                  style: AppUIConfig.text.body,
                ),
              ],
              SizedBox(height: AppUIConfig.metrics.spacingLarge),
              FilledButton(
                onPressed: () => context.go('/dashboard'),
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: AppUIConfig.components.inputRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppUIConfig.metrics.paddingDefault, vertical: AppUIConfig.metrics.paddingSmall),
                  child: Text(AppUIConfig.strings.goToDashboard, style: AppUIConfig.text.button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
