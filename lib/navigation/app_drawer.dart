import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../authentication_page/login.dart';
import '../resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../support/logger.dart';
class appdrawer extends StatefulWidget {
  const appdrawer({super.key});

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => loginpage()),
            (route) => false);
  }



  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: bluem,
      width: 240,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [],
      ),
    );
  }
}


