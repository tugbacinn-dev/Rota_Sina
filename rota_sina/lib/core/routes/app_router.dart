import 'package:flutter/material.dart';
import 'package:rota_sina/features/appointments/presentation/pages/appointments_page.dart';
import 'package:rota_sina/features/auth/presentation/pages/login_page.dart';
import 'package:rota_sina/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const String login = '/login';
  static const String home = '/home';
  static const String appointments = '/appointments';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case appointments:
        return MaterialPageRoute(builder: (_) => const AppointmentsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
} 