import 'package:dio/dio.dart';
import 'package:flutter_exam/core/config/app_config.dart';

final apiClient = Dio(
  BaseOptions(
    baseUrl: AppConfig.apiUrl,
    headers: {
      'CLIENT_ID': AppConfig.clientId,
    },
  ),
);
