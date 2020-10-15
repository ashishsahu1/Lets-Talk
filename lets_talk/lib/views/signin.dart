import 'package:flutter/material.dart';
import 'package:lets_talk/widgets/widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child:Column(
            children: [
              TextField(
                style: inputText(),
                decoration: textfieldInputDecoration("email"),
              ),
              TextField(
                style: inputText(),
                decoration: textfieldInputDecoration("password"),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Text("Forget Password?",style:inputText(),)
              ),
              ),
              SizedBox(height: 8,),
            ],
          ),
      ),
    );
  }
}