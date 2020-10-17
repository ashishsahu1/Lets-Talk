import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController =
      new TextEditingController();

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
                  Container(
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
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
