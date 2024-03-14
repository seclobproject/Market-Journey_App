import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_journey/screens/members/widgets/level_two.dart';
import 'package:master_journey/screens/report/widgets/level1.dart';
import 'package:master_journey/screens/report/widgets/level2.dart';
import 'package:master_journey/screens/report/widgets/level3.dart';
import 'package:master_journey/screens/report/widgets/level4.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';

import '../../support/logger.dart';
import '../members/widgets/level_one.dart';
import '../wallet/widgets/recent_transaction.dart';
import '../wallet/widgets/withdrawal_history.dart';


class report extends StatefulWidget {
  const report({super.key});

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: marketbg,
      appBar: AppBar(
        backgroundColor: marketbg,
        title: Text("Report", style: TextStyle(color: black, fontSize: 18)),
      ),

      body: DefaultTabController(
        length: 4, // Number of tabs
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
                Tab(text: 'Level 1'), // Title for first tab
                Tab(text: 'Level 2'),
                Tab(text: 'Wallet'),
                Tab(text: 'Withdrawal'), // Title for second tab
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  levelonereport(),
                  leveltworeport(),
                  levelthreereport(),
                  levelfourreport(),
                ],
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}


