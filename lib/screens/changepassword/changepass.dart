import 'package:flutter/material.dart';

import '../../resources/color.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  bool _obscurenewText = true;
  bool _obscurechangeText = true;

  void _togglenewVisibility() {
    setState(() {
      _obscurenewText = !_obscurenewText;
    });
  }

  void _togglechangeVisibility() {
    setState(() {
      _obscurechangeText = !_obscurechangeText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password',
            style: TextStyle(color: black, fontSize: 16)),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Image.asset(
                  'assets/logo/changepass.png',
                  height: 200,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: _obscurenewText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurenewText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: _togglenewVisibility,
                    ),
                    hintText: 'Create New Password',
                    hintStyle: TextStyle(
                        color: marketbgblue, fontWeight: FontWeight.w400),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: yellow, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: yellow),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      // email = text;
                    });
                  },
                  style: TextStyle(
                      color: black, fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: _obscurechangeText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurechangeText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: _togglechangeVisibility,
                    ),
                    hintText: 'Confirm New Password',
                    hintStyle: TextStyle(
                        color: marketbgblue, fontWeight: FontWeight.w400),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: yellow, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: yellow),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      // email = text;
                    });
                  },
                  style: TextStyle(
                      color: black, fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 400,
                      decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'Confirm',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
