import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/util/result.dart';
import '../../model/social_model.dart';

class SocialRemoteSource {
  const SocialRemoteSource(this._apiClient);

  final Dio _apiClient;

  Result<List<SocialModel>> fetchSocials() async {
    try {
      final response = await _apiClient.get('/api/v1/socials');

      if (response.statusCode == HttpStatus.ok) {
        final listData = (response.data as List?) ?? [];

        final socials =
            listData.map((jsonData) => SocialModel.fromJson(jsonData)).toList();

        print(socials.length);

        return Right(socials);
      }

      if (response.statusCode == HttpStatus.unauthorized) {
        return const Left(UnauthorizedFailure());
      }

      return const Left(ServerFailure());
    } catch (error) {
      return const Left(UnexpectedFailure());
    }
  }
}
