

import 'package:neiramdal_misis/features/auth/models/user.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final UserModel user;

  HomeSuccess(this.user);
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
