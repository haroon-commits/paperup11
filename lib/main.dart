import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/core/navigation/app_router.dart';
import 'package:paperup1/core/theme/app_theme.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/core/theme/models/theme_config.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:paperup1/core/theme/state/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final user = ref.watch(authProvider).user;
    final role = user?.role ?? 'student';
    final themeConfig = ref.watch(themeNotifierProvider)[role] ?? ThemeConfig.studentDefault();

    return Builder(
      builder: (context) {
        // Initialize the responsive engine once we have context
        Responsive.init(context);
        
        return MaterialApp.router(
          title: AppUIConfig.strings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromConfig(themeConfig, isDark: false),
          darkTheme: AppTheme.getThemeFromConfig(themeConfig, isDark: true),
          themeMode: ThemeMode.system,
          routerConfig: router,
        );
      }
    );
  }
}
