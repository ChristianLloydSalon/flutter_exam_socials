part of 'socials_bloc.dart';

abstract class SocialsEvent extends Equatable {
  const SocialsEvent();

  @override
  List<Object?> get props => [];
}

class SocialsRequested extends SocialsEvent {
  const SocialsRequested();
}
