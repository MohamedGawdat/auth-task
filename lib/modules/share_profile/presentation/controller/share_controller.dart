import 'package:get/get.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entity/user_entity.dart';

class ShareProfileController extends GetxController {
  final ShareProfile shareProfile;

  ShareProfileController(this.shareProfile);

  Future<void> shareUserProfile(UserEntity user) async {
    await shareProfile.call(user);
  }
}
