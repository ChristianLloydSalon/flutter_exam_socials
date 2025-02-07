import 'package:flutter_exam/core/network/api_client.dart';

import '../data/data_source/remote/social_remote_source.dart';
import '../data/repository/social_repository_impl.dart';

final socialRemoteSource = SocialRemoteSource(apiClient);
final socialRepository = SocialRepositoryImpl(socialRemoteSource);
