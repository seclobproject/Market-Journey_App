import 'package:flutter/material.dart';

import 'package:master_journey/screens/members/widgets/dropdownbutton.dart';
import 'package:master_journey/screens/members/widgets/add_member.dart';


import '../../resources/color.dart';


class memberspage extends StatefulWidget {
  const memberspage({super.key});

  @override
  State<memberspage> createState() => _memberspageState();
}

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
          style: TextStyle(color: black, fontSize: 18),
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
