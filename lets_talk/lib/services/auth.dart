import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User _user
    Future signInWithEmailAndPassword(String email, String password) async {
    try {
        UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
        User firebaseuser = result.user;

    } catch (e) {}
  }
}
