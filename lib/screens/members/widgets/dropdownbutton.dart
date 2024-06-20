import 'package:flutter/material.dart';
import 'package:master_journey/screens/members/widgets/filtereduser.dart';
import 'package:master_journey/screens/members/widgets/level_one.dart';

import '../../../../resources/color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../services/member_service.dart';
import '../../../support/logger.dart';

class Dropdownscreen extends StatefulWidget {
  @override
  State<Dropdownscreen> createState() => _DropdownscreenState();
}

class _DropdownscreenState extends State<Dropdownscreen> {
  // Text editing controller for the search bar
  TextEditingController searchController = TextEditingController();

  List<String> items = [
    'All Package Type',
    'District Franchise',
    'Zonal Franchise',
    'Mobile Franchise',
    'Nifty',
    'Bank Nifty',
    'Morning Cafe',
    'Night Cafe',
    'Crude Oil'
  ];

  String? selectedItem = 'All Package Type';
  List<String> filteredItems = [];

  String? zonalItem;
  List<String> zonalType = [];

  String? panchayathItem;
  List<String> panchayathType = [];

  Future<void> _Memberzonal(String districtId) async {
    try {
      var response = await MemberService.Memberzonal(districtId);
      log.i('Zonal API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'Zonals retrieved successfully') {
        setState(() {
          var zonals = response['zonals'];

          // Extract zonal names and remove duplicates
          zonalType = List<String>.from(
              zonals.map((zonal) => zonal['name']).toSet().toList());
          log.i('Zonal names extracted: $zonalType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching zonals: $e');
    }
  }

  Future<void> _Memberpanchayath(String zonalId) async {
    try {
      var response = await MemberService.Memberpanchayath(zonalId);
      log.i('Panchayath API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'panchayaths retrieved successfully') {
        setState(() {
          var panchayaths = response['panchayaths'];

          // Extract Panchayath names and remove duplicates
          panchayathType = List<String>.from(panchayaths
              .map((panchayath) => panchayath['name'])
              .toSet()
              .toList());
          log.i('Panchayath names extracted: $panchayathType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching panchayaths: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the filtered items list with all items, ensuring there are no duplicates
    filteredItems = items.toSet().toList();
  }

  // Function to filter items based on search input
  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      // Filter the list of items based on the query
      setState(() {
        filteredItems = items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      // Reset the filtered list to the original list of items
      setState(() {
        filteredItems = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: marketbg,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search bar implementation
            Container(
              height: 40,
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  // Filter search results without affecting dropdown
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: yellow)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: yellow)),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: yellow)),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            // Dropdown button implementation
            Row(
              children: [
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      value: selectedItem,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 7),
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: filteredItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (String? item) {
                        setState(() {
                          selectedItem = item;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      value: selectedItem,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 7),
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: filteredItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (String? item) {
                        setState(() {
                          selectedItem = item;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      value: selectedItem,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 7),
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: panchayathType.map((String panchayath) {
                        return DropdownMenuItem<String>(
                          value: panchayath,
                          child: Text(
                            panchayath,
                            style: TextStyle(fontSize: 12, color: bluem),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          panchayathItem = newVal;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
                child: Filtereduser(
              searchQuery: searchController.text,
              selectedFranchise: selectedItem,
            )),
          ],
        ),
      ),
    );
  }
}
