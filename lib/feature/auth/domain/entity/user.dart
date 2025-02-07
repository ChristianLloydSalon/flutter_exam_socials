import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.photoURL,
  });

  final String id;
  final String username;
  final String photoURL;

  static const empty = User(
    id: '',
    username: '',
    photoURL: '',
  );

  bool get isEmpty => this == empty;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [id, username, photoURL];
}
