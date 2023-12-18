import '../../../auth/domain/entities/user_entity.dart';

abstract class ShareProfileRepository {
  Future<void> shareUserProfile(UserEntity user);
}
