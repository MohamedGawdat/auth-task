import 'package:firebase_auth/firebase_auth.dart';

import '../interfaces/i_auth_service.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> updateUserDisplayName(String userId, String name) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && user.uid == userId) {
      await user.updateDisplayName(name);
    } else {
      throw Exception('User not found or mismatched user ID');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
