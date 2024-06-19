import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:master_journey/screens/demateaccount/widget/demataccount.dart';

import '../../services/bank_service.dart';
import '../../services/profile_service.dart';
import '../../support/logger.dart';

class Dematedetails extends StatefulWidget {
  const Dematedetails({super.key});

  @override
  State<Dematedetails> createState() => _DematedetailsState();
}

class _DematedetailsState extends State<Dematedetails> {
  var userid;
  List<dynamic> demateAccounts = [];
  Map<String, dynamic>? profiledata;

  @override
  void initState() {
    super.initState();
    _Dematedetail();
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

  Future<void> _Dematedetail() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var response = await BankService.Dematedetail();
      log.i('Profile data show.... $response');
      setState(() {
        demateAccounts = response['demateAccounts'] ?? [];
      });
    } catch (error) {
      log.e('Error fetching award data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demat details',
          style: TextStyle(color: black, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: bluem,
        ),
        backgroundColor: yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Demataccount()),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    if (profiledata == null) {
      return Center(child: CircularProgressIndicator());
    } else if (profiledata!['packageType'] == 'Franchise') {
      return Center(
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
      );
    } else {
      return ListView.builder(
        itemCount: demateAccounts.length,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              width: 400,
              height: 180,
              decoration: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: const Color.fromRGBO(206, 206, 206, 0.5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'District',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 60),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          demateAccounts[index]['district'] ?? 'No Title',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 68),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          demateAccounts[index]['name'] ?? '',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 44),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          demateAccounts[index]['demateUserName'] ?? '',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Mobile Number",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 16),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          demateAccounts[index]['phone'].toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 70),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          demateAccounts[index]['email'] ?? '',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 55),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          demateAccounts[index]['address'] ?? '',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: bluem),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
