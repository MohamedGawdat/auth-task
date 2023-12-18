abstract class IAuthService {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> updateUserDisplayName(String userId, String name);
  Future<void> signOut();
}
