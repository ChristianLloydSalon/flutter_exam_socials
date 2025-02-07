import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Social extends Equatable {
  const Social({
    required this.name,
    required this.history,
    required this.iconUrl,
    required this.imageUrl,
    required this.webUrl,
  });

  final String name;
  final String history;
  final String iconUrl;
  final String imageUrl;
  final String webUrl;

  @override
  List<Object?> get props => [
        name,
        history,
        iconUrl,
        imageUrl,
        webUrl,
      ];
}

enum SocialName {
  youtube,
  spotify,
  facebook;

  Color get color => switch (this) {
        SocialName.youtube => Colors.red,
        SocialName.spotify => Colors.green,
        SocialName.facebook => Colors.blue,
      };
}
