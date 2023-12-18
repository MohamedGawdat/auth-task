import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserController extends GetxController {
  final Rx<UserEntity?> _user = Rx<UserEntity?>(null);

  UserEntity? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    _updateUserEntity(FirebaseAuth.instance.currentUser);
  }

  Future<void> updateUserProfile(String newName, String newEmail) async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      if (firebaseUser.displayName != newName) {
        await _updateUserName(firebaseUser, newName);
      }
      if (firebaseUser.email != newEmail) {
        await _updateEmail(firebaseUser, newEmail);
      }
      await _reloadUser(firebaseUser);
    }
  }

  _updateEmail(User user, String email) async {
    await user.updateEmail(email);
  }

  _updateUserName(User user, String name) async {
    await user.updateDisplayName(name);
  }

  Future<void> _reloadUser(User firebaseUser) async {
    await firebaseUser.reload();
    _updateUserEntity(FirebaseAuth.instance.currentUser);
  }

  void _updateUserEntity(User? firebaseUser) {
    if (firebaseUser != null) {
      _user.value = UserEntity(
        id: firebaseUser.uid,
        name: firebaseUser.displayName,
        email: firebaseUser.email,
      );
    }
  }
}
