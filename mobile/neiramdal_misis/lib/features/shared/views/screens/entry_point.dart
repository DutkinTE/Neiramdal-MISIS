// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neiramdal_misis/core/constants/routes.dart';
import 'package:neiramdal_misis/features/auth/auth.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  bool _navigated = false;

  void _navigate(String route) {
    if (!mounted || _navigated) return;
    _navigated = true;
    Future.microtask(() {
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepository()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            _navigate(AppRoutes.main);
          } else if (state is AuthFailure || state is AuthInitial) {
            _navigate(AppRoutes.login);
          }
        },
        child: const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
