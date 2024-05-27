import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class Demataccount extends StatefulWidget {
  const Demataccount({super.key});

  @override
  State<Demataccount> createState() => _DemataccountState();
}

class _DemataccountState extends State<Demataccount> {
  String? stateDropdownvalue;
  List stateVal = ['Kerala', 'Tamilnadu', 'Karnataka'];

  String? districtDropdownvalue;
  List districtVal = ['Item1', 'Item2', 'Item3'];

  String? zonalDropdownvalue;
  List zonalVal = ['Test1', 'Test2', 'Test3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Demat Account', style: TextStyle(color: black, fontSize: 16)),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Name',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Mobile Number',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Address',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'State',
                    style: TextStyle(color: marketbgblue),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 2),
                        ),
                        hintText: '---choose---',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: marketbgblue) // Remove underline
                        ),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    elevation: 10,
                    style: TextStyle(fontSize: 15),
                    items: stateVal.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 12, color: marketbgblue),
                        ),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        stateDropdownvalue = newVal as String?;
                      });
                    },
                    value: stateDropdownvalue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'District',
                    style: TextStyle(color: marketbgblue),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 2),
                        ),
                        hintText: '---choose---',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: marketbgblue) // Remove underline
                        ),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    elevation: 10,
                    style: TextStyle(fontSize: 15),
                    items: districtVal.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 12, color: marketbgblue),
                        ),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        districtDropdownvalue = newVal as String?;
                      });
                    },
                    value: districtDropdownvalue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Zonal',
                    style: TextStyle(color: marketbgblue),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 2),
                        ),
                        hintText: '---choose---',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: marketbgblue) // Remove underline
                        ),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    elevation: 10,
                    style: TextStyle(fontSize: 15),
                    items: zonalVal.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 12, color: marketbgblue),
                        ),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        zonalDropdownvalue = newVal as String?;
                      });
                    },
                    value: zonalDropdownvalue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('User Name Demat Account',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 40,
                  width: 400,
                  decoration: BoxDecoration(
                      color: yellow, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
