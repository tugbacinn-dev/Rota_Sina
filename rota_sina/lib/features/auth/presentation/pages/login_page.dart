import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rota_sina/core/routes/app_router.dart';
import 'package:rota_sina/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rota_sina/features/auth/presentation/bloc/auth_event.dart';
import 'package:rota_sina/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.login,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.email,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.l10n.password,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthLoginRequested(
                    email: 'test@example.com',
                    password: 'password',
                  ));
                  Navigator.of(context).pushReplacementNamed(AppRouter.home);
                },
                child: Text(context.l10n.loginButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 