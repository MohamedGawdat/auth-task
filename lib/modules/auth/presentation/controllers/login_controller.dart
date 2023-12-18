import 'package:get/get.dart';
import '../pages/user_info.dart';
import '../../domain/use_cases/login_user.dart';

class LoginController extends GetxController {
  final LoginUser loginUserUseCase;

  LoginController(this.loginUserUseCase);

  Future<void> login(String email, String password) async {
    try {
      await loginUserUseCase.call(email, password);
      Get.offAll(() => UserInfoPage());
    } catch (e) {
      Get.snackbar("Error", "Failed to login: $e");
    }
  }
}
