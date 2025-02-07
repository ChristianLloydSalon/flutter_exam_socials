import '../../../core/network/api_client.dart';
import '../data/data_source/remote/auth_remote_source.dart';
import '../data/repository/auth_repository_impl.dart';

final authRemoteSource = AuthRemoteSource(apiClient);
final authRepository = AuthRepositoryImpl(authRemoteSource);
