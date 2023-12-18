import '../../../../core/network/interfaces/i_auth_service.dart';
import '../models/user_model.dart';

class AuthDataSource {
  final IAuthService authService;

  AuthDataSource(this.authService);

  Future register(String email, String password) async {
    try {
      var user = await authService.signUpWithEmail(email, password);

      return user;
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  Future<void> login(String email, String password) async {
    await authService.signInWithEmail(email, password);
  }

  Future<void> updateUserDetails(String userId, String name) async {
    await authService.updateUserDisplayName(userId, name);
  }

  Future<void> signOut() async {
    await authService.signOut();
  }
}
