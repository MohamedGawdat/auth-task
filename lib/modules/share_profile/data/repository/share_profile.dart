import '../../../../utils/share/share_plus.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/repository/share_plus.dart';

class ShareProfileRepositoryImpl implements ShareProfileRepository {
  @override
  Future<void> shareUserProfile(UserEntity user) async {
    String shareText = "Name: ${user.name}\nEmail: ${user.email}";
    await ShareUtil.shareText(shareText);
  }
}
