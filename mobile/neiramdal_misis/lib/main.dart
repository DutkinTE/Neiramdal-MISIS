import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neiramdal_misis/core/constants/routes.dart';
import 'package:neiramdal_misis/features/auth/bloc/auth_bloc.dart';
import 'package:neiramdal_misis/features/auth/repositories/auth_repository.dart';
import 'package:neiramdal_misis/features/auth/views/login_screen.dart';
import 'package:neiramdal_misis/features/shared/views/screens/entry_point.dart';
import 'package:neiramdal_misis/features/shared/views/screens/main_navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Алабуга',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: EntryPoint(),
      routes: {
        AppRoutes.login: (context) => BlocProvider(
          create: (context) => AuthBloc(AuthRepository()),
          child: const LoginScreen(),
        ),
        AppRoutes.main: (_) => MainNavigationScreen(),
        AppRoutes.entryPoint: (_) => EntryPoint(),
      },
    );
  }
}
