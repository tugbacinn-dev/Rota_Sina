import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/features/treatments/presentation/pages/treatments_page.dart';
import 'package:untitled/features/centers/presentation/pages/centers_page.dart';
import 'package:untitled/features/appointments/presentation/pages/appointments_page.dart';
import 'package:untitled/features/products/presentation/pages/products_page.dart';
import 'package:untitled/features/auth/presentation/pages/login_page.dart';
import 'package:untitled/features/profile/presentation/pages/profile_page.dart';
import 'package:untitled/features/explore/presentation/pages/explore_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/treatments',
          builder: (context, state) => const TreatmentsPage(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsPage(),
        ),
        GoRoute(
          path: '/centers',
          builder: (context, state) => const CentersPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/appointments',
          builder: (context, state) => const AppointmentsPage(),
        ),
        GoRoute(
          path: '/explore',
          builder: (context, state) => const ExplorePage(),
        ),
      ],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/treatments');
              break;
            case 1:
              context.go('/products');
              break;
            case 2:
              context.go('/appointments');
              break;
            case 3:
              context.go('/explore');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
        selectedIndex: _calculateSelectedIndex(context),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.medical_services),
            label: 'Tedaviler',
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_bag_outlined),
            selectedIcon: const Icon(Icons.shopping_bag),
            label: 'Ürünler',
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_today),
            selectedIcon: const Icon(Icons.calendar_today),
            label: 'Randevular',
          ),
          NavigationDestination(
            icon: const Icon(Icons.explore),
            selectedIcon: const Icon(Icons.explore),
            label: 'İyileş ve Gez',
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/treatments')) return 0;
    if (location.startsWith('/products')) return 1;
    if (location.startsWith('/appointments')) return 2;
    if (location.startsWith('/explore')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }
}