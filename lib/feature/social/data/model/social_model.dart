import 'package:flutter_exam/core/util/json_parser.dart';

import '../../domain/entity/social.dart';

class SocialModel extends Social {
  const SocialModel({
    required super.name,
    required super.history,
    required super.iconUrl,
    required super.imageUrl,
    required super.webUrl,
  });

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    return SocialModel(
      name: json.parseString('name'),
      history: json.parseString('history'),
      iconUrl: json.parseString('iconUrl'),
      imageUrl: json.parseString('imgUrl'),
      webUrl: json.parseString('webUrl'),
    );
  }
}
