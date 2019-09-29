import 'package:flutter/material.dart';
import './LoginSignup.dart';
import 'package:flutter_login_demo/services/authentication.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Helmet",
      home: new LoginSignup(),
    );
  }
}
