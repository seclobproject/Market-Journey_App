import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_journey/screens/members/widgets/dropdownbutton.dart';
import 'package:master_journey/screens/members/widgets/add_member.dart';
import 'package:master_journey/screens/members/widgets/level_one.dart';
import 'package:master_journey/screens/members/widgets/level_two.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../support/logger.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class memberspage extends StatefulWidget {
  const memberspage({super.key});

  @override
  State<memberspage> createState() => _memberspageState();
}

// class _memberspageState extends State<memberspage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: marketbg, // Replace with your color
//         appBar: AppBar(
//           backgroundColor: marketbg,
//           // Replace with your color
//           iconTheme: IconThemeData(
//             color: Colors.black, // Replace with your color
//           ),
//           centerTitle: true,
//           title: Text(
//             "Member View",
//             style: TextStyle(color: black, fontSize: 16),
//           ),

//           elevation: 0,
//           bottom: TabBar(
//             indicatorSize: TabBarIndicatorSize.label,
//             indicatorColor: Colors.yellow,
//             labelStyle: TextStyle(
//               fontSize: 12.0,
//             ),
//             // Replace with your color

//             tabs: [
//               Tab(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text("Level 1", style: TextStyle(color: bluem)),
//                 ),
//               ),
//               Tab(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text("Level 2", style: TextStyle(color: bluem)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             levelone(),
//             leveltwo(),
//           ],
//         ),

//         floatingActionButton: FloatingActionButton(
//           // isExtended: true,
//           child: Icon(
//             Icons.add,
//             color: bluem,
//           ),
//           backgroundColor: yellow,
//           onPressed: () {
//             setState(() {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const AddMemberPage()),
//               );
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

class _memberspageState extends State<memberspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg, // Replace with your color
      appBar: AppBar(
        backgroundColor: marketbg,
        // Replace with your color
        iconTheme: IconThemeData(
          color: Colors.black, // Replace with your color
        ),
        centerTitle: true,
        title: Text(
          "Member View",
          style: TextStyle(color: black, fontSize: 16),
        ),
      ),
      body: Dropdownscreen(),

      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(
          Icons.add,
          color: bluem,
        ),
        backgroundColor: yellow,
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddMemberPage()),
            );
          });
        },
      ),
    );
  }
}
