import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';
import 'package:master_journey/services/member_service.dart';
import 'package:master_journey/support/logger.dart';

class Childone extends StatefulWidget {
  final String searchQuery;

  const Childone({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<Childone> createState() => _ChildoneState();
}

class _ChildoneState extends State<Childone> {
  int isSelected = 0;
  List child1 = [];
  List child2 = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initLoad();
  }

  // Function to fetch data for child1
  Future<void> _ChildOneData() async {
    try {
      var response = await MemberService.leveloneview();
      log.i('child1 data: $response');
      setState(() {
        child1 = response['child1'] ?? [];
        log.i('Updated child1 state: $child1');
      });
    } catch (error) {
      log.e('Error fetching child1 data: $error');
    }
  }

  // Function to fetch data for child2
  Future<void> _ChildTwoData() async {
    try {
      var response = await MemberService.leveltwoview();
      log.i('child2 data: $response');
      setState(() {
        child2 = response['child2'] ?? [];
        log.i('Updated child2 state: $child2');
      });
    } catch (error) {
      log.e('Error fetching child2 data: $error');
    }
  }

  // Function to initialize data load
  Future<void> _initLoad() async {
    setState(() {
      _isLoading = true;
    });
    await Future.wait([
      _ChildOneData(),
      _ChildTwoData(),
    ]);
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildDataRow(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        height: 115,
        width: 312,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: bluem,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Name", style: TextStyle(fontSize: 12, color: marketbg)),
                  SizedBox(width: 63),
                  Text(":", style: TextStyle(fontSize: 12, color: marketbg)),
                  SizedBox(width: 12),
                  Text(data['name'] ?? '',
                      style: TextStyle(fontSize: 12, color: marketbg)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Franchise",
                      style: TextStyle(fontSize: 12, color: marketbg)),
                  SizedBox(width: 41),
                  Text(":", style: TextStyle(fontSize: 12, color: marketbg)),
                  SizedBox(width: 12),
                  Text(data['franchise'] ?? '',
                      style: TextStyle(fontSize: 12, color: marketbg)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Package",
                      style: TextStyle(fontSize: 12, color: marketbg)),
                  SizedBox(width: 48),
                  Text(":", style: TextStyle(fontSize: 12, color: marketbg)),
                  SizedBox(width: 12),
                  // Displaying the package amount based on availability
                  Text(
                    data['tempPackageAmount']?.toString() ??
                        data['actualPackageAmount']?.toString() ??
                        data['packageAmount']?.toString() ??
                        '',
                    style: TextStyle(fontSize: 12, color: marketbg),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = 0;
                      });
                    },
                    child: Container(
                      width: 90,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: greenbg),
                        color: isSelected == 0 ? greenbg : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Level 1",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = 1;
                      });
                    },
                    child: Container(
                      width: 90,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: greenbg),
                        color: isSelected == 1 ? greenbg : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Level 2",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isSelected == 0
                ? child1.isEmpty
                ? Center(child: Text("No data available"))
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: child1.length,
              itemBuilder: (context, index) {
                return _buildDataRow(child1[index]);
              },
            )
                : child2.isEmpty
                ? Center(child: Text("No data available2"))
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: child2.length,
              itemBuilder: (context, index) {
                return _buildDataRow(child2[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}