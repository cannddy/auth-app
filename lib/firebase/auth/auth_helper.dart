import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final FirebaseAuth auth;
  const AuthHelper(this.auth);

  Future<bool> signup(String username, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool verifyUser() {
    final user = auth.currentUser;
    if(user != null) {
      return true;
    } else {
      return false;
    }
  }


  Future<bool> signin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


}
