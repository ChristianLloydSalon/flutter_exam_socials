import 'package:flutter_exam/core/util/json_parser.dart';

import '../../domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.username,
    required super.photoURL,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.parseString('userId'),
      username: json.parseString('userName'),
      photoURL: json.parseString('profilePicture'),
    );
  }
}
