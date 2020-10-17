import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUsername(String username) {}

  uploadUsrInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}
