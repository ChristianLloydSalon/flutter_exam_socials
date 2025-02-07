import '../../../../core/util/result.dart';
import '../../domain/entity/auth_request.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_remote_source.dart';
import '../model/auth_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteSource);

  final AuthRemoteSource _remoteSource;

  @override
  Result<User> login({required AuthRequest request}) async {
    return await _remoteSource.login(
      request: AuthRequestModel(
        username: request.username,
        otp: request.otp,
      ),
    );
  }

  @override
  Result<void> logout() async {
    return await _remoteSource.logout();
  }
}
