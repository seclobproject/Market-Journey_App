import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_journey/screens/wallet/widgets/cashwithdraw.dart';
import 'package:master_journey/screens/wallet/widgets/recent_transaction.dart';
import 'package:master_journey/screens/wallet/widgets/withdrawal_history.dart';
import '../../resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../support/logger.dart';

class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluem,
        title: Text("Wallet", style: TextStyle(color: marketbg, fontSize: 18)),
      ),
      backgroundColor: bluem,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Balance",
                    style: TextStyle(color: whitegray),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹1,05,210",
                        style: TextStyle(
                            color: marketbg,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: whitegray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: SizedBox(
                          child: Image.asset(
                            'assets/logo/wallet.png',
                            fit: BoxFit.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cashwithdraw()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  height: 40,
                  // width: 150,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Request withdrawal cash',
                      style: TextStyle(
                          fontSize: 12,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                color: marketbg,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Withdrawal History',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 1000, // Adjust height as needed
                      child: withdrawalhistory(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
