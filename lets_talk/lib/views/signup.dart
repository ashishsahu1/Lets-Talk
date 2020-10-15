import 'package:flutter/material.dart';
import 'package:lets_talk/widgets/widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child:Column(
            children: [
              Image.asset("assets/images/logo3.png",
              height: 70,),
              Image.asset("assets/images/logo2.png",
              height: 50,),
              SizedBox(height: 25,),
              TextField(
                style: inputText(),
                decoration: textfieldInputDecoration("username"),
              ),
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
              SizedBox(height: 25,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff6A87FD),
                      const Color(0xff3E5EDE),
                    ]
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Sign up",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff6A87FD),
                      const Color(0xff3E5EDE),
                    ]
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Sign up with Google",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have a account?",style: inputText(),),
                  Text("Sign-in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),)
                ],
              )
            ],
          ),
      ),
      ) ,
    );
  }
}
