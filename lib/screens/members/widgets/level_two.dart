import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';
import '../../../services/member_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../support/logger.dart';
import 'level_one.dart';

class LevelUser extends StatefulWidget {
  const LevelUser({super.key});

  @override
  State<LevelUser> createState() => _LevelUserState();
}

class _LevelUserState extends State<LevelUser> {
  String? userid;
  List<Map<String, dynamic>> child1 = [];
  bool _isLoading = true;

  Future<void> _levelUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');

      var response = await MemberService.leveloneuser();
      log.i('Profile data show.... $response');

      setState(() {
        child1 = List<Map<String, dynamic>>.from(response['child1'] ?? []);
      });
    } catch (e) {
      log.e('Failed to load user data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _levelUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg,
      body: _isLoading
          ? Center(child: CircularProgressIndicator(
        strokeWidth: 6.0,
        valueColor: AlwaysStoppedAnimation(yellow),
      ),)
          : ListView.builder(
        itemCount: child1.length,
        itemBuilder: (BuildContext context, int index) {
          final user = child1[index];
          return Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: bluem,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Name",
                            style:
                            TextStyle(fontSize: 12, color: marketbg),
                          ),
                          SizedBox(width: 40),
                          Text(":",
                              style: TextStyle(
                                  fontSize: 12, color: marketbg)),
                          SizedBox(width: 18),
                          Text(
                            user['name'] ?? '',
                            style:
                            TextStyle(fontSize: 12, color: marketbg),
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
                            "Franchise",
                            style:
                            TextStyle(fontSize: 12, color: marketbg),
                          ),
                          SizedBox(width: 20),
                          Text(":",
                              style: TextStyle(
                                  fontSize: 12, color: marketbg)),
                          SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              user['franchise'] ?? '',
                              style: TextStyle(
                                  fontSize: 12, color: marketbg),
                            ),
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
                            "Package",
                            style:
                            TextStyle(fontSize: 12, color: marketbg),
                          ),
                          SizedBox(width: 26),
                          Text(":",
                              style: TextStyle(
                                  fontSize: 12, color: marketbg)),
                          SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              "₹ ${user['tempPackageAmount']?.toString() ?? user['actualPackageAmount']?.toString() ?? user['packageAmount']?.toString() ?? ''}",
                              style: TextStyle(
                                  fontSize: 12, color: marketbg),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // _buildInfoRow("Name", user['name']),
                    // SizedBox(height: 10),
                    // _buildInfoRow("Franchise", user['franchise']),
                    // SizedBox(height: 10),
                    // _buildInfoRow(
                    //   "Package",
                    //   user['tempPackageAmount']?.toString() ??
                    //       user['actualPackageAmount']?.toString() ??
                    //       user['packageAmount']?.toString() ??
                    //       '',
                    // ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            String id = user['_id'];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelOne(id: id),
                              ),
                            );
                          },
                          child: Container(
                            width: 65,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: yellow,
                            ),
                            child: Center(
                              child: Text(
                                'View Tree',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Color(0xff0F1535),
                                ),
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
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: marketbg),
          ),
          SizedBox(width: 20),
          Text(
            ":",
            style: TextStyle(fontSize: 12, color: marketbg),
          ),
          SizedBox(width: 20),
          Text(
            value ?? '',
            style: TextStyle(fontSize: 12, color: marketbg),
          ),
        ],
      ),
    );
  }
}