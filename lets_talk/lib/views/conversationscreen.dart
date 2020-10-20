import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  
  Widget ChatMessageList(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo2.png", height: 50),
        backgroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: Stack(
        children: [
          Container(
            alignment:Alignment.bottomCenter,
               child: Container(
                color: Colors.white38,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  
                  children: [
                    Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                      //controller: searchTextEditingController,
                      decoration: InputDecoration(
                        hintText: "write something to send...",
                        border: InputBorder.none,
                      ),
                       
                    )),
                    GestureDetector(
                      onTap: () {
                        //intiateSearch();
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
