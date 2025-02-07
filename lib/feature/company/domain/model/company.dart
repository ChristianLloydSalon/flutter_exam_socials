import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company({
    required this.logo,
    required this.name,
    required this.website,
  });

  final String logo;
  final String name;
  final String website;

  static const empty = Company(logo: '', name: '', website: '');

  @override
  List<Object?> get props => [logo, name, website];
}
