import 'package:go_router/go_router.dart';
import 'package:neuroloop/presentations/home_screen.dart';

import '../../features/reader/presentation/pages/reader_view.dart';
import '../../features/reader/presentation/providers/reader_scope.dart';

class AppRouter {
  AppRouter._();

  static final config = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/reader',
        builder: (_, __) => const ReaderScope(
          child: ReaderView(),
        ),
      ),
    ],
  );
}
