import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> register(String email, String password);
  Future<void> login(String email, String password);
  Future<void> signOut();
  Future<void> updateUserDetails(String userId, String name);
}
