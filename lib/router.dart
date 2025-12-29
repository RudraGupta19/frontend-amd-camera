import 'package:go_router/go_router.dart';
import 'features/home/home_screen.dart';
import 'features/splash/splash_screen.dart';
import 'features/rec/rec_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/primary/primary_screen.dart';
import 'features/colour/colour_screen.dart';
import 'features/advanced/advanced_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) => const NoTransitionPage(child: SplashScreen()),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
      ),
      GoRoute(
        path: '/primary',
        name: 'primary',
        pageBuilder: (context, state) => const NoTransitionPage(child: PrimaryScreen()),
      ),
      GoRoute(
        path: '/colour',
        name: 'colour',
        pageBuilder: (context, state) => const NoTransitionPage(child: ColourScreen()),
      ),
      GoRoute(
        path: '/advanced',
        name: 'advanced',
        pageBuilder: (context, state) => const NoTransitionPage(child: AdvancedScreen()),
      ),
      GoRoute(
        path: '/rec',
        name: 'rec',
        pageBuilder: (context, state) => const NoTransitionPage(child: RecScreen()),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        pageBuilder: (context, state) => const NoTransitionPage(child: SettingsScreen()),
      ),
    ],
    initialLocation: '/splash',
  );
}
