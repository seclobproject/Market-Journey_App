import 'package:flutter/material.dart';
import 'package:master_journey/screens/members/widgets/filtereduser.dart';

import '../../../../resources/color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/profile_service.dart';
import '../../../support/logger.dart';

class Dropdownscreen extends StatefulWidget {
  @override
  State<Dropdownscreen> createState() => _DropdownscreenState();
}

class _DropdownscreenState extends State<Dropdownscreen> {
  // Text editing controller for the search bar
  TextEditingController searchController = TextEditingController();
  var userId;
  var profileData;
  var zonal;
  var panchayath;

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

  Future<void> _Viewzonal(String id) async {
    try {
      var response = await ProfileService.viewzonal(id);
      log.i('Zonal API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'get user profile Success') {
        // Updated condition
        setState(() {
          zonal = response['zonal'];

          // Extract zonal names and remove duplicates
          zonalType = List<String>.from(
              zonal.map((zonal) => zonal['name']).toSet().toList());
          log.i('Zonal names extracted: $zonalType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching zonal data: $e');
    }
  }

  Future<void> _Viewpanchayath(String id) async {
    try {
      var response = await ProfileService.viewpanchayath(id);
      log.i('Panchayath API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'Districts retrieved success') {
        // Updated condition
        setState(() {
          panchayath = response['panchayath'];

          // Extract panchayath names and remove duplicates
          panchayathType = List<String>.from(panchayath
              .map((panchayath) => panchayath['name'])
              .toSet()
              .toList());
          log.i('Panchayath names extracted: $panchayathType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching panchayath data: $e');
    }
  }

  Future<void> _fetchProfileData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userId = prefs.getString('userid');
      var response = await ProfileService.profile();
      log.i('Profile data show.... $response');
      setState(() {
        profileData = response;
      });

      // Fetch zonal or panchayath data based on profile type
      if (profileData != null) {
        if (profileData['franchise'] == 'Zonal Franchise' &&
            profileData['zonalFranchise'] != null) {
          _Viewpanchayath(profileData['zonalFranchise']);
        } else if (profileData['districtFranchise'] != null) {
          _Viewzonal(profileData['districtFranchise']);
        }
      }
    } catch (e) {
      log.e('Error fetching profile data: $e');
      // Handle error appropriately, e.g., show a snackbar or a message to the user
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the filtered items list with all items, ensuring there are no duplicates
    filteredItems = items.toSet().toList();
    _fetchProfileData(); // Fetch the profile data when the widget initializes
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
    bool showZonalDropdown =
        profileData != null && profileData['franchise'] == 'Zonal Franchise';

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
                  filterSearchResults(value);
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
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                      ),
                      isExpanded: true,
                      value: selectedItem,
                      style: TextStyle(fontSize: 12, color: Colors.black),
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
                if (!showZonalDropdown) ...[
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
                        value: zonalItem,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 7),
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'zonal',
                          hintStyle: TextStyle(fontSize: 10, color: bluem),
                        ),
                        items: zonalType.map((String zonal) {
                          return DropdownMenuItem<String>(
                            value: zonal,
                            child: Text(
                              zonal,
                              style: TextStyle(fontSize: 12, color: bluem),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            zonalItem = newVal;
                            // Fetch panchayath data using zonal ID
                            if (newVal != null) {
                              // Assuming that you have the zonal ID here
                              var selectedZonal = zonal.firstWhere(
                                  (z) => z['name'] == newVal,
                                  orElse: () => null);
                              if (selectedZonal != null) {
                                _Viewpanchayath(selectedZonal['id']);
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
                SizedBox(
                  width: 10,
                ),
                
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
                      value: panchayathItem,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 7),
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Panchayath',
                        hintStyle: TextStyle(fontSize: 10, color: bluem),
                      ),
                      items: panchayathType
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
                          panchayathItem = item;
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
