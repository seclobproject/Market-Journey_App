import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';
import 'package:master_journey/screens/bankdetails/widgets/nomineeaccount.dart';

import 'widgets/bankaccount.dart';

class Bankdetails extends StatefulWidget {
  const Bankdetails({super.key});

  @override
  State<Bankdetails> createState() => _BankdetailsState();
}

class _BankdetailsState extends State<Bankdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank details',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                indicatorColor: yellow,
                dividerColor: Colors.transparent,
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                labelColor: black,
                unselectedLabelColor: black,
                tabs: [
                  Tab(text: 'Bank Account'),
                  // Title for first tab
                  Tab(text: 'Nominee Account'),
                ],
              ),
            ),SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                children: [Bankaccount(), Nomineeaccount()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
