import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_talk/views/charRoomScreen.dart';

class DatabaseMethods {
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  getUserByUserEmail(String userEmail) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
        .get();
  }

  uploadUsrInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  // createChatRoom(String chatroomid, chatRoomMap) {
  //   FirebaseFirestore.instance.collection("ChatRoom").doc(chatroomid).set(ChatRoom);
  // }
  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e);
    });
  }

  getConversationMessages(String chatRoomId, messageMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
