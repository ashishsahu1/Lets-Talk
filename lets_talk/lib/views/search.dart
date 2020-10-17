import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/services/database.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController =
      new TextEditingController();

  QuerySnapshot searchSnapshot;

  intiateSearch() {
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  //chaTROOM ,

  createChatRoomAndStartConversation()


  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (context, index) {
              return searchTile(
                userName: searchSnapshot.docs[index].data()["name"],
                userEmail: searchSnapshot.docs[index].data()["email"],
              );
            })
        : Container();
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
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white38,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Search username...",
                      border: InputBorder.none,
                    ),
                  )),
                  GestureDetector(
                    onTap: () {
                      intiateSearch();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(colors: [
                              const Color(0xff6A87FD),
                              const Color(0xff3E5EDE),
                            ])),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class searchTile extends StatelessWidget {
  final String userName;
  final String userEmail;

  searchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

      child: Row(
        children: [
          Column(
            children: [
              Text(userName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
              Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  const Color(0xff6A87FD),
                  const Color(0xff3E5EDE),
                ]),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Text("Message",
              style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
