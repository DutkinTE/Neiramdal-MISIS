import 'package:neiramdal_misis/features/auth/models/auth_param.dart';

abstract class AuthEvent {}

class AuthRequested extends AuthEvent {
  final AuthParamModel param;

  AuthRequested(this.param);
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  LoginRequested(this.username, this.password);
}

class Logout extends AuthEvent {
}

class CheckAuthStatus extends AuthEvent {}
