import 'package:flutter/material.dart';
import 'package:lets_talk/services/database.dart';
import 'package:lets_talk/views/search.dart';
import 'package:lets_talk/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  String name = Talk.Talkto_name;

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController messageController = new TextEditingController();
  Stream chatMessageStream;

  Widget ChatMessageList() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return MessageTile(snapshot.data.docs[index].data()["message"]);
            });
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> MessageMap = {
        "message": messageController.text,
        "sendBy": constants.myName,
      };
      print("done till here");
      databaseMethods.addConversationMessages(widget.chatRoomId, MessageMap);
      messageController.text = "";
    }
  }

  @override
  void initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((val) {
      setState(() {
        chatMessageStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Say Hi to, $name',
          style: TextStyle(
            color: Color(0xff3E5EDE),
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: Stack(
        children: [
          ChatMessageList(),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white38,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: messageController,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    //controller: searchTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Say hi, $name",
                      border: InputBorder.none,
                    ),
                  )),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(colors: [
                              const Color(0xff6A87FD),
                              const Color(0xff3E5EDE),
                            ])),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  MessageTile(this.message);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        message,
      ),
    );
  }
}
