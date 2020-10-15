import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    toolbarHeight: 80,
  );
}

InputDecoration textfieldInputDecoration(String hinteText) {
  return InputDecoration(
      hintText: hinteText,
      hintStyle: TextStyle(color: Colors.black54),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ));
}

TextStyle inputText() {
  return TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
}
