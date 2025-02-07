import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_exam/feature/auth/data/model/user_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/util/result.dart';
import '../../model/auth_request_model.dart';

class AuthRemoteSource {
  const AuthRemoteSource(this._apiClient);

  final Dio _apiClient;

  Result<UserModel> login({required AuthRequestModel request}) async {
    try {
      final response = await _apiClient.post(
        '/api/v1/login',
        data: request.toJson(),
      );

      if (response.statusCode == HttpStatus.ok) {
        return Right(UserModel.fromJson(response.data));
      }

      if (response.statusCode == HttpStatus.unauthorized) {
        return const Left(UnauthorizedFailure());
      }

      return const Left(ServerFailure());
    } catch (error) {
      return const Left(UnexpectedFailure());
    }
  }

  Result<void> logout() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      return const Right(null);
    } catch (error) {
      return const Left(ServerFailure());
    }
  }
}
