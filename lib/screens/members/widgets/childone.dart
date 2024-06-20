import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../services/member_service.dart';
// import '../../../support/logger.dart';

class Childone extends StatefulWidget {
  final String searchQuery;

  const Childone({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<Childone> createState() => _ChildoneState();
}

class _ChildoneState extends State<Childone> {
  var userid;
  var isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        "level 1 ",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: black),
                      )),
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
                        "level 2 ",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: black),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            isSelected == 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 63),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "ghj",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Franchise name",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "ghj",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Package",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 47),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        "hjk",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 63),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "lj",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Franchise name",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "ghj",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Package",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 47),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        "hjk",
                                        style: TextStyle(
                                            fontSize: 12, color: marketbg),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

// var child1;
// List filteredChild1 = [];
// bool _isLoading = false;

// Future _childOne() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance