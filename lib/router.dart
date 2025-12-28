import 'package:go_router/go_router.dart';
import 'features/home/home_screen.dart';
import 'features/rec/rec_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/primary/primary_screen.dart';
import 'features/colour/colour_screen.dart';
import 'features/advanced/advanced_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/primary',
        name: 'primary',
        builder: (context, state) => const PrimaryScreen(),
      ),
      GoRoute(
        path: '/colour',
        name: 'colour',
        builder: (context, state) => const ColourScreen(),
      ),
      GoRoute(
        path: '/advanced',
        name: 'advanced',
        builder: (context, state) => const AdvancedScreen(),
      ),
      GoRoute(
        path: '/rec',
        name: 'rec',
        builder: (context, state) => const RecScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    initialLocation: '/home',
  );
}
