import '../../../auth/domain/entities/user_entity.dart';
import '../repository/share_plus.dart';

class ShareProfile {
  final ShareProfileRepository repository;

  ShareProfile(this.repository);

  Future<void> call(UserEntity user) async {
    await repository.shareUserProfile(user);
  }
}
