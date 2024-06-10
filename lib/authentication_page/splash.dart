import 'dart:async';
import 'package:flutter/material.dart';
import 'package:master_journey/authentication_page/transcation.dart';
import '../resources/color.dart';
import 'LandingPage.dart';
import 'login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg,
      body: Center(
        child: Image.asset(
          'assets/logo/logomaster.png',
          width: 200, // Set the desired width
          height: 200, // Set the desired height
        ),
      ),
    );
  }
}
