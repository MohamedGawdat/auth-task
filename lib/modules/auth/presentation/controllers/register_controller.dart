import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../pages/user_info.dart';
import '../../domain/use_cases/register_user.dart';

class RegisterController extends GetxController {
  final RegisterUser registerUserUseCase;

  RegisterController(this.registerUserUseCase);

  Future<void> register(String email, String password, String name) async {
    try {
      await registerUserUseCase.call(email, password);
      await updateUserDisplayName(name);

      Get.offAll(() => const UserInfoPage());
    } catch (e) {
      Get.snackbar("Registration Error", e.toString());
    }
  }

  Future<void> updateUserDisplayName(String name) async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await firebaseUser.updateDisplayName(name);
      await firebaseUser.reload();
    }
  }
}
