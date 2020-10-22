import 'package:flutter/material.dart';
import 'package:lets_talk/helper/authenticate.dart';
import 'package:lets_talk/helper/constant.dart';
import 'package:lets_talk/helper/helperFunction.dart';
import 'package:lets_talk/services/auth.dart';
import 'package:lets_talk/services/database.dart';
import 'package:lets_talk/views/conversationscreen.dart';
import 'package:lets_talk/views/search.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatRoomStream;

  Widget chatRoomList() {
    return StreamBuilder(
        stream: chatRoomStream,
        //initilData: [],
        builder: (context, snapshot) {
          return snapshot == null
              ? Container()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return ChatRooms(snapshot.data.docs[index]
                        .data()["chatroomid"]
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(constants.myName, ""),
                        snapshot.data.docs[index]
                        .data()["chatroomid"]
                        );
                  });
        });
  }

  @override
  void initState() {
    getuserinfo();
    super.initState();
  }

  getuserinfo() async {
    constants.myName = await helperFunction.getUserNameInSharedPrefference();
    print(constants.myName);
    print("myname");
    databaseMethods.getChatRooms(constants.myName).then((val) {
      setState(() {
        chatRoomStream = val;
        print(
            "we got the data + ${chatRoomStream.toString()} this is name  ${constants.myName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo2.png", height: 50),
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        actions: [
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Color(0xff6A87FD),
                  size: 40,
                )),
          ),
        ],
      ),
      body: chatRoomList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6A87FD),
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}

class ChatRooms extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  ChatRooms(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationScreen(chatRoomId)
          
          ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  //color: Colors.blue,

                  ),
              child: Image.asset(
                "assets/images/logo4.png",
                height: 50,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              userName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
