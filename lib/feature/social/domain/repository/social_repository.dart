import '../../../../core/util/result.dart';
import '../entity/social.dart';

abstract class SocialRepository {
  Result<List<Social>> fetchSocials();
}
