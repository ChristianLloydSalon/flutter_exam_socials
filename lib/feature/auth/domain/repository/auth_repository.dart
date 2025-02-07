import '../../../../core/util/result.dart';
import '../entity/auth_request.dart';
import '../entity/user.dart';

abstract class AuthRepository {
  Result<User> login({required AuthRequest request});
  Result<void> logout();
}
