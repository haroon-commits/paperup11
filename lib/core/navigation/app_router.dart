import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/modules/auth/presentation/pages/login_page.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/modules/dashboard/presentation/pages/dashboard_page.dart';
import 'package:paperup1/modules/attendance/presentation/pages/attendance_page.dart';
import 'package:paperup1/modules/homework/presentation/pages/homework_page.dart';
import 'package:paperup1/modules/fees/presentation/pages/fees_page.dart';
import 'package:paperup1/modules/exams/presentation/pages/results_page.dart';
import 'package:paperup1/modules/communication/presentation/pages/messages_page.dart';
import 'package:paperup1/modules/timetable/presentation/pages/timetable_page.dart';
import 'package:paperup1/modules/auth/presentation/pages/profile_page.dart';
import 'package:paperup1/modules/dashboard/presentation/pages/home_shell.dart';
import 'package:paperup1/core/navigation/not_found_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    errorBuilder: (context, state) => NotFoundPage(location: state.uri.toString()),
    redirect: (context, state) {
      final isLoggedIn = authState.user != null;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/attendance',
            builder: (context, state) => const AttendancePage(),
          ),
          GoRoute(
            path: '/messages',
            builder: (context, state) => const MessagesPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/homework',
            builder: (context, state) => const HomeworkPage(),
          ),
          GoRoute(
            path: '/fees',
            builder: (context, state) => const FeesPage(),
          ),
          GoRoute(
            path: '/results',
            builder: (context, state) => const ResultsPage(),
          ),
          GoRoute(
            path: '/timetable',
            builder: (context, state) => const TimetablePage(),
          ),
        ],
      ),
    ],
  );
});
