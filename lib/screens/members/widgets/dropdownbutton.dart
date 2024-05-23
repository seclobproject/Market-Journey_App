import 'package:flutter/material.dart';
import 'package:master_journey/screens/members/widgets/level_one.dart';

import '../../../../resources/color.dart';

// class Dropdownbutton extends StatefulWidget {
//   const Dropdownbutton({super.key});

//   @override
//   State<Dropdownbutton> createState() => _DropdownbuttonState();
// }

// class _DropdownbuttonState extends State<Dropdownbutton> {
//   List<String> items = ['item1', 'item2', 'item3'];
//   String? selectedItem = 'item1';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Searchbar(),

//       DropdownButton<String>(
//         value: selectedItem,
//         items: items
//             .map((items) => DropdownMenuItem<String>(
//                   value: items,
//                   child: Text(
//                     items,
//                     style: TextStyle(fontSize: 24),
//                   ),
//                 ))
//             .toList(),
//         onChanged: (items) => setState(() => selectedItem = items),
//       ),
//     );
//   }
// }

class Dropdownscreen extends StatefulWidget {
  @override
  State<Dropdownscreen> createState() => _DropdownscreenState();
}

class _DropdownscreenState extends State<Dropdownscreen> {
  // List of items to be displayed in the dropdown
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
  // The currently selected item
  String? selectedItem = 'All Package Type';
  // Text editing controller for the search bar
  TextEditingController searchController = TextEditingController();
  // Filtered list of items based on the search input
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered items list with all items
    filteredItems = items;
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
      // appBar: AppBar(
      //   backgroundColor: marketbg,
      // ),
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
            Container(
              width: 180,
              height: 40,
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(5),
                // border: Border.all(color: Colors.black),
              ),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedItem,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 15,
                              ),
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
            SizedBox(
              height: 10,
            ),
            Expanded(child: levelone())
          ],
        ),
      ),
    );
  }
}
