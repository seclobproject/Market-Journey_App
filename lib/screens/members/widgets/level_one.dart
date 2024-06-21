import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';

import '../../../services/member_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../support/logger.dart';

class levelone extends StatefulWidget {
  const levelone({
    super.key,
  });

  @override
  State<levelone> createState() => _leveloneState();
}

class _leveloneState extends State<levelone> {
  var userid;

  List child1 = [];
  bool _isLoading = true;

  Future _leveview() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');

    var response = await MemberService.leveloneview();
    log.i('Profile data show.... $response');
    setState(() {
      child1 = response['child1'] ?? [];
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _leveview(),
      ],
    );
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _initLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: child1 != null ? child1.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Container(
                  height: 107,
                  width: 400,
                  decoration: BoxDecoration(
                      color: bluem,
                      borderRadius: BorderRadius.circular(10)),
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
                            SizedBox(
                              width: 40,
                            ),
                            Text(":",
                                style: TextStyle(
                                    fontSize: 12, color: marketbg)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              child1[index]['name'],
                              style:
                              TextStyle(fontSize: 12, color: marketbg),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Franchise",
                              style:
                              TextStyle(fontSize: 12, color: marketbg),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(":",
                                style: TextStyle(
                                    fontSize: 12, color: marketbg)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              child1[index]['franchise'],
                              style:
                              TextStyle(fontSize: 12, color: marketbg),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Package",
                              style:
                              TextStyle(fontSize: 12, color: marketbg),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(":",
                                style: TextStyle(
                                    fontSize: 12, color: marketbg)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              child1[index]['tempPackageAmount'].toString(),
                              style:
                              TextStyle(fontSize: 12, color: marketbg),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}