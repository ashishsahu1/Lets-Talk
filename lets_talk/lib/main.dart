import 'package:lets_talk/helper/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lets_talk/helper/helperFunction.dart';
import 'package:lets_talk/views/charRoomScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getLoggedInState() async {
    await helperFunction.getuserLoggedInSharedPrefference().then((value) {
      userIsLoggedIn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: userIsLoggedIn!=null ? userIsLoggedIn ? ChatRoom() : Authenticate(): blank() );
  }
}

class blank extends StatefulWidget {
  @override
  _blankState createState() => _blankState();
}

class _blankState extends State<blank> {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}