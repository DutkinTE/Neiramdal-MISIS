import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neiramdal_misis/core/constants/routes.dart';
import 'package:neiramdal_misis/core/network/dio_service.dart';
import 'package:neiramdal_misis/features/auth/bloc/auth_bloc.dart';
import 'package:neiramdal_misis/features/auth/bloc/auth_event.dart';
import 'package:neiramdal_misis/features/auth/bloc/auth_state.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'timur@gmail.com');
  final _passwordController = TextEditingController(text: 'nbvfnbgf');

  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    DioService().init();

    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });

    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(
      LoginRequested(_usernameController.text.trim(), _passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacementNamed(context, AppRoutes.main);
        } else if (state is AuthFailure) {
          setState(() {
            _isLoading = false;
          });
          print(state.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(42, 44, 69, 1),
                    Color.fromRGBO(40, 62, 149, 1),
                    Color.fromRGBO(52, 48, 73, 1),
                  ],
                  stops: [0, 0.36, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Галактический вход',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(0, 174, 239, 0.2),
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(40, 62, 149, 1),
                              Color.fromRGBO(0, 93, 172, 1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              label: 'Логин',
                              controller: _usernameController,
                              placeholder: 'Login',
                            ),
                            const SizedBox(height: 16),
                            CustomTextFormField(
                              label: 'Пароль',
                              controller: _passwordController,
                              isPassword: true,
                              placeholder: 'Password',
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                          40,
                                          62,
                                          149,
                                          1,
                                        ),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                        ),
                                        elevation: 4,
                                      ),
                                      onPressed: _handleLogin,
                                      child: const Text(
                                        'Войти',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Нет аккаунта? Давайте зарегистрируемся!',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 227, 148, 1),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
