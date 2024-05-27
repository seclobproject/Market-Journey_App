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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Cashwithdraw()),
                );
              },
                child: Container(
                  height: 40,
                  width: 400,
                  decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    'Request withdrawal cash',
                    style: TextStyle(fontSize: 12, color: black),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 510,
              decoration: BoxDecoration(
                  color: marketbg,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: DefaultTabController(
                length: 2, // Number of tabs
                child: Column(
                  children: [
                    TabBar(
                      labelColor: black,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: yellow,
                      labelStyle: TextStyle(
                        fontSize: 12.0,
                      ),
                      tabs: [
                        Tab(text: 'Recent Transaction'), // Title for first tab
                        Tab(text: 'Withdrawal History'), // Title for second tab
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [recenttransation(), withdrawalhistory()],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
