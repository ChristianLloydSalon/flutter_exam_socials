import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/social.dart';
import '../../domain/repository/social_repository.dart';

part 'socials_event.dart';

part 'socials_state.dart';

class SocialsBloc extends Bloc<SocialsEvent, SocialsState> {
  SocialsBloc(this._repository) : super(const SocialsState()) {
    on<SocialsRequested>(_onRequested);
  }

  final SocialRepository _repository;

  Future<void> _onRequested(
    SocialsRequested event,
    Emitter<SocialsState> emit,
  ) async {
    emit(state.copyWith(requestStatus: SocialsRequestStatus.loading));

    final result = await _repository.fetchSocials();

    result.fold(
      (error) {
        emit(state.copyWith(requestStatus: SocialsRequestStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            requestStatus: SocialsRequestStatus.success,
            items: data,
          ),
        );
      },
    );

    emit(state.copyWith(requestStatus: SocialsRequestStatus.initial));
  }
}
