import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/bottom_tabs_screen.dart';
import '../resources/color.dart';
import '../services/login_service.dart';
import '../support/logger.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool hidePassword = true;
  String? email;
  String? password;
  bool isLoading = false;
  bool _isLoader = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    var reqData = {
      'email': email,
      'password': password,
    };
    try {
      var response = await LoginService.login(reqData);

      if (response['sts'] == '01') {
        log.i('Login Success');
        print('User ID: ${response['id']}');
        print('Token: ${response['access_token']}');

        // _saveAndRedirectToHome(response['access_token'], response['name']);
        _saveAndRedirectToHome(response['access_token'], response['id']);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Success'),
        ));
        gotoHome();
      } else {
        // log.e('Login failed: ${response['msg']}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login failed: ${response['msg']}'),
        ));

        loginpage();
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _isLoader = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect Username and password   '),
      ));
      log.e('Error during login: $error');
    }
  }

  void _saveAndRedirectToHome(usertoken, userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", usertoken);
    await prefs.setString("userid", userId);
  }

  gotoHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomTabsScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo/logomaster.png',
            width: 150, // Set the desired width
            height: 150, // Set the desired height
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Username ",
                  style: TextStyle(color: marketbgblue,fontSize: 12),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your username',
                hintStyle: TextStyle(color: marketbgblue,fontWeight: FontWeight.w400),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: yellow, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: yellow),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  email = text;
                });
              },
              style: TextStyle(color: black, fontSize: 12,fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password ",
                  style: TextStyle(color: marketbgblue,fontSize: 12),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              obscureText: hidePassword,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: marketbgblue),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: yellow, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: yellow),
                ),
                suffixIcon: IconButton(
                  icon: hidePassword
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
              ),
              onChanged: (text) {
                setState(() {
                  password = text;
                });
              },
              style: TextStyle(color: black, fontSize: 12,fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              _login();
              _isLoader = true;
              Navigator.of(context).pushAndRemoveUntil;
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => BottomTabsScreen()),
              //         (route) => false);

            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 55,
                width: 400,
                decoration: BoxDecoration(
                    color: yellow, borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )),
              ),
            ),

          ),

        ],
      ),
    );
  }
}
