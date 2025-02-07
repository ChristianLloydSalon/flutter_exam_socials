import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/auth_request.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repository) : super(const AuthState()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  final AuthRepository _repository;

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(requestStatus: AuthRequestStatus.loading));

    final result = await _repository.login(request: event.request);

    result.fold(
      (error) {
        emit(state.copyWith(requestStatus: AuthRequestStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            requestStatus: AuthRequestStatus.success,
            user: data,
          ),
        );
      },
    );

    emit(state.copyWith(requestStatus: AuthRequestStatus.initial));
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(requestStatus: AuthRequestStatus.loading));

    final result = await _repository.logout();

    result.fold(
      (error) {
        emit(state.copyWith(requestStatus: AuthRequestStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.unauthenticated,
            requestStatus: AuthRequestStatus.success,
          ),
        );
      },
    );

    emit(state.copyWith(requestStatus: AuthRequestStatus.initial));
  }
}
