import 'package:flutter/material.dart';
import 'package:master_journey/screens/members/widgets/dropdownbutton.dart';
import 'package:master_journey/screens/members/widgets/add_member.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/profile_service.dart';
import '../../support/logger.dart';

class memberspage extends StatefulWidget {
  const memberspage({super.key});

  @override
  State<memberspage> createState() => _memberspageState();
}

class _memberspageState extends State<memberspage> {
  String? userid;
  Map<String, dynamic>? profiledata;

  @override
  void initState() {
    super.initState();
    _profileData();
  }

  Future<void> _profileData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var response = await ProfileService.profile();
      log.i('Profile data show.... $response');
      setState(() {
        profiledata = response;
      });
    } catch (e) {
      log.e('Error fetching profile data: $e');
      // Handle error appropriately, e.g., show a snackbar or a message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg, // Replace with your color
      appBar: AppBar(
        backgroundColor: marketbg, // Replace with your color
        iconTheme: IconThemeData(
          color: Colors.black, // Replace with your color
        ),
        centerTitle: true,
        title: Text(
          "Member View",
          style: TextStyle(color: black, fontSize: 18),
        ),
      ),
      body: profiledata == null
          ? Center(child: CircularProgressIndicator())
          : profiledata!['packageType'] == 'Franchise'
          ? Dropdownscreen()
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/exclamation-mark.png', // Replace with your image path
              height: 25,
              width: 25,
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'You Are Not Authorized to View This Page',
                style: TextStyle(color: black, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
      profiledata != null && profiledata!['packageType'] == 'Franchise'
          ? FloatingActionButton(
        child: Icon(
          Icons.add,
          color: bluem,
        ),
        backgroundColor: yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddMemberPage()),
          );
        },
      )
          : null,
    );
  }
}