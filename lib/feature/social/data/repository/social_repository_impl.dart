import 'package:flutter_exam/core/util/result.dart';

import 'package:flutter_exam/feature/social/domain/entity/social.dart';

import '../../domain/repository/social_repository.dart';
import '../data_source/remote/social_remote_source.dart';

class SocialRepositoryImpl implements SocialRepository {
  const SocialRepositoryImpl(this._remoteSource);

  final SocialRemoteSource _remoteSource;

  @override
  Result<List<Social>> fetchSocials() async {
    return await _remoteSource.fetchSocials();
  }
}
