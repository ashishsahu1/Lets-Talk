import 'package:firebase_auth/firebase_auth.dart';
import 'package:lets_talk/modal/user.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

    //here Userid is the instance type(return type) of userid class that we have made
  Userid _userFromFirebaseUser(User user) {
    return user != null ? Userid(userid: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = result.user;
      return _userFromFirebaseUser(firebaseuser);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = result.user;
      return _userFromFirebaseUser(firebaseuser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
