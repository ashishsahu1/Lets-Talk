import 'package:flutter/material.dart';
import 'package:lets_talk/services/auth.dart';

class ChatRoom extends StatefulWidget {
  AuthMethods authMethods = new AuthMethods();

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo2.png",
            height: 50, alignment: Alignment.center),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
