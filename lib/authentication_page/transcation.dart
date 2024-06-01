import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_journey/authentication_page/login.dart';
import 'package:master_journey/resources/color.dart';

import '../screens/home/home_page.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          height: 312,
          width: 312,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: whitegray,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Package Amount',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                '₹10000',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Transaction ID",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 32,
                width: 249,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: yellow, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: yellow, width: 1)),
                )
              )),
              SizedBox(
                height: 17,
              ),
              Text(
                "Payment Screenshot",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 32,
                width: 249,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: yellow, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: yellow, width: 1)),
                  )

                    ),
                  ),


              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                },
                child: Center(
                  child: Container(
                    height: 24,
                    width: 104,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: yellow1,
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
