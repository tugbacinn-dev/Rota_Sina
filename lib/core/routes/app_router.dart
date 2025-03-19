import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/features/treatments/presentation/pages/treatments_page.dart';
import 'package:untitled/features/centers/presentation/pages/centers_page.dart';
import 'package:untitled/features/appointments/presentation/pages/appointments_page.dart';
import 'package:untitled/features/products/presentation/pages/products_page.dart';
import 'package:untitled/features/welcome/presentation/pages/welcome_page.dart';
import 'package:untitled/features/auth/presentation/pages/login_page.dart';
import 'package:untitled/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
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
          path: '/centers',
          builder: (context, state) => const CentersPage(),
        ),
        GoRoute(
          path: '/appointments',
          builder: (context, state) => const AppointmentsPage(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
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
              context.go('/centers');
              break;
            case 2:
              context.go('/appointments');
              break;
            case 3:
              context.go('/products');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
        selectedIndex: _calculateSelectedIndex(context),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.medical_information_outlined),
            selectedIcon: const Icon(Icons.medical_information),
            label: l10n.treatments,
          ),
          NavigationDestination(
            icon: const Icon(Icons.medical_services_outlined),
            selectedIcon: const Icon(Icons.medical_services),
            label: l10n.centers,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            selectedIcon: const Icon(Icons.calendar_month),
            label: l10n.appointments,
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_bag_outlined),
            selectedIcon: const Icon(Icons.shopping_bag),
            label: l10n.products,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/treatments')) return 0;
    if (location.startsWith('/centers')) return 1;
    if (location.startsWith('/appointments')) return 2;
    if (location.startsWith('/products')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }
}