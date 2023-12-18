import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future register(
    String email,
    String password,
  ) async {
    try {
      var userModel = await dataSource.register(email, password);
      return userModel;
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await dataSource.login(email, password);
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<void> updateUserDetails(String userId, String name) async {
    try {
      await dataSource.updateUserDetails(userId, name);
    } catch (e) {
      throw Exception('Failed to update user details: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await dataSource.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
