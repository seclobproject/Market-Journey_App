import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/color.dart';
import 'LandingPage.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('token');
    print("Retrieved token in splash screen: $userToken"); // Debug output

    Timer(
      Duration(seconds: 2),
          () {
        if (userToken == null || userToken!.isEmpty) {
          print("No token found, navigating to login page."); // Debug output
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => loginpage()),
          );
        } else {
          print("Token found, navigating to home page."); // Debug output
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Landing_Page(title: "Home")),
          );
        }
      },
    );
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