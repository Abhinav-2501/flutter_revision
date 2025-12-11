import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter_event.dart';
import '../counter_state.dart';
import '../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final result = await repository.login(event.email, event.password);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
