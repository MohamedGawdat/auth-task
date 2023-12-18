import '../repositories/auth_repository.dart';

class UpdateUserDetails {
  final AuthRepository repository;

  UpdateUserDetails(this.repository);

  Future<void> call(String userId, String name) async {
    await repository.updateUserDetails(userId, name);
  }
}
