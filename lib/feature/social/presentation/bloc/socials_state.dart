part of 'socials_bloc.dart';

class SocialsState extends Equatable {
  const SocialsState({
    this.items = const [],
    this.requestStatus = SocialsRequestStatus.initial,
  });

  final List<Social> items;
  final SocialsRequestStatus requestStatus;

  SocialsState copyWith({
    List<Social>? items,
    SocialsRequestStatus? requestStatus,
  }) {
    return SocialsState(
      items: items ?? this.items,
      requestStatus: requestStatus ?? this.requestStatus,
    );
  }

  @override
  List<Object?> get props => [items, requestStatus];
}

enum SocialsRequestStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == SocialsRequestStatus.initial;

  bool get isLoading => this == SocialsRequestStatus.loading;

  bool get isSuccess => this == SocialsRequestStatus.success;

  bool get isError => this == SocialsRequestStatus.error;
}
