import 'package:flutter/material.dart';

AppBar buildAppbar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Login Page!",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
