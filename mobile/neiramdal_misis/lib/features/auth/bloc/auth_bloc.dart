import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<AuthRequested>(_onAuthRequested);
    on<LoginRequested>(_onLoginRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<Logout>(_onLogout);
    add(CheckAuthStatus());
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await repository.login(event.username, event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthLogout());
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isAuthenticated = await repository.checkAuthStatus();
      if (isAuthenticated) {
        final user = await repository.getCurrentUser();
        emit(AuthSuccess(user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onAuthRequested(
    AuthRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await repository.authenticate(event.param);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
