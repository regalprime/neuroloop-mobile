import 'package:go_router/go_router.dart';

import '../presentations/theme_picker_screen.dart';

class AppRouter {
  AppRouter._();

  static final config = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const ThemePickerScreen(),
      ),
      GoRoute(
        path: '/settings/theme',
        builder: (_, __) => const ThemePickerScreen(),
      ),
    ],
  );
}
