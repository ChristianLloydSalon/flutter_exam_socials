import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../util/auth_validator.dart';

part 'auth_form_event.dart';

part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(const AuthFormState()) {
    on<AuthFormUsernameChanged>(_onUsernameChanged);
    on<AuthFormOtpChanged>(_onOtpChanged);
    on<AuthFormCleared>(_onCleared);
  }

  void _onUsernameChanged(
    AuthFormUsernameChanged event,
    Emitter<AuthFormState> emit,
  ) {
    emit(
      state.copyWith(
        username: event.username,
        usernameError: AuthValidator.validateUsername(event.username),
      ),
    );
  }

  void _onOtpChanged(
    AuthFormOtpChanged event,
    Emitter<AuthFormState> emit,
  ) {
    emit(
      state.copyWith(
        otp: event.otp,
        otpError: AuthValidator.validateOtp(event.otp),
      ),
    );
  }

  void _onCleared(
    AuthFormCleared event,
    Emitter<AuthFormState> emit,
  ) {
    emit(const AuthFormState());
  }
}
