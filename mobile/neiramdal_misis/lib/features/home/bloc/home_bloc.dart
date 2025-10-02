import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neiramdal_misis/features/auth/models/user.dart';
import 'package:neiramdal_misis/features/home/bloc/home_event.dart';
import 'package:neiramdal_misis/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<GetUserForHome>(_getUser);
    add(GetUserForHome());
  }

  Future<void> _getUser(GetUserForHome event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final user = await UserStorage.getUserData();
      emit(HomeSuccess(user!));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
