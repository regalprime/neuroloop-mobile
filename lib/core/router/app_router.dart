import 'package:go_router/go_router.dart';
import 'package:neuroloop/features/reader/presentation/pages/reader_view.dart';
import 'package:neuroloop/features/reader/presentation/providers/reader_scope.dart';
import 'package:neuroloop/features/settings/presentation/setting_screen.dart';
import 'package:neuroloop/features/settings/presentation/theme_picker_screen.dart';
import 'package:neuroloop/main/app/app_shell.dart';
import 'package:neuroloop/presentations/home_screen.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter config = GoRouter(
    initialLocation: AppRoutes.dashboard,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (
          context,
          state,
          navigationShell,
        ) {
          return AppShell(
            navigationShell: navigationShell,
          );
        },
        branches: [
          _dashboardBranch(),
          _readerBranch(),
          _settingsBranch(),
        ],
      ),
    ],
  );

  static StatefulShellBranch _dashboardBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) {
            return const DashboardTab();
          },
        ),
      ],
    );
  }

  static StatefulShellBranch _readerBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.reader,
          builder: (context, state) {
            return const ReaderScope(
              child: ReaderView(),
            );
          },
        ),
      ],
    );
  }

  static StatefulShellBranch _settingsBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.settings,
          builder: (_, __) => const SettingScreen(),
          routes: [
            GoRoute(
              path: 'theme',
              builder: (_, __) => const ThemePickerScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
