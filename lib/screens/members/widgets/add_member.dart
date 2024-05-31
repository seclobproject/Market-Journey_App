import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:master_journey/services/package_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../resources/color.dart';
import '../../../services/member_service.dart';
import '../../../support/logger.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  var userid;
  var packagedata;
  var states;
  var stateId;
  var districts;
  var districtId;
  var zonals;
  var zonalId;

  bool _isLoading = false;

  String? name;
  String? email;
  int? phone;
  int? dob;
  String? password;

  String? packageTypedropdownvalue;
  List<String> packageType = [];

  String? packageNamedropdownvalue;
  List<String> packageName = [];

  String? stateTypedropdownvalue;
  List<String> stateType = [];

  String? districtTypedropdownvalue;
  List<String> districtType = [];

  String? zonalTypedropdownvalue;
  List<String> zonalType = [];

  String? panchayathTypedropdownvalue;
  List<String> panchayathType = [];

  Future _Memberstate() async {
    try {
      var response = await MemberService.Memberstate();
      log.i('State API response: $response');

      // Check the response structure and log relevant parts
      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'States retrieved successfully') {
        setState(() {
          states = response;
          stateType = List<String>.from(
              states['states'].map((state) => state['stateName']));
          log.i('State names extracted: $stateType');

          // Extract the state IDs and assign to a variable
          List<String> stateIds =
              List<String>.from(states['states'].map((state) => state['id']));
          log.i('State IDs extracted: $stateIds');

          // Assign the first state ID to stateId (or handle as needed)
          if (stateIds.isNotEmpty) {
            stateId =
                stateIds[0]; // Or any specific logic to select the desired ID
            log.i('State ID assigned: $stateId');
          } else {
            log.e('No state IDs found in response');
          }
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching states: $e');
    }
  }

  Future<void> _Memberdistrict(districtId) async {
    var reqData = {
      'id': districtId,
    };

    try {
      var response = await MemberService.Memberdistrict(districtId);
      log.i('District API response: $response');

      setState(() {
        if (response.containsKey('districts')) {
          var districtsList = response['districts'];

          // Extract district IDs and assign the first one to districtId
          List<String> districtIds = List<String>.from(
              districtsList.map((district) => district['id']).toList());
          log.i('District IDs extracted: $districtIds');

          if (districtIds.isNotEmpty) {
            districtId = districtIds[
                0]; // Or any specific logic to select the desired ID
            log.i('District ID assigned: $districtId');
          } else {
            log.e('No district IDs found in response');
          }

          // Map district names and remove duplicates
          districtType = List<String>.from(districtsList
              .map((district) => district['name'])
              .where((name) => name != null)
              .toSet()
              .toList());
          log.i('District names extracted: $districtType');

          print(districtType);
        }
      });
    } catch (e) {
      log.e('Error fetching districts: $e');
    }
  }

  Future<void> _Memberzonal(id) async {
    print("$id hgvhg");
    var reqData = {
      districtId: id, // Use the id parameter here
    };

    try {
      var response = await MemberService.Memberzonal(id);
      log.i('Zonal API response: $response');

      setState(() {
        if (response.containsKey('zonals')) {
          var zonalsList = response['zonals'];

          // Extract zonal IDs and assign the first one to zonalId
          List<String> zonalIds = List<String>.from(
              zonalsList.map((zonal) => zonal['id']).toList());
          log.i('Zonal IDs extracted: $zonalIds');

          if (zonalIds.isNotEmpty) {
            zonalId =
                zonalIds[0]; // Or any specific logic to select the desired ID
            log.i('Zonal ID assigned: $zonalId');
          } else {
            log.e('No zonal IDs found in response');
          }

          // Map zonal names and remove duplicates
          zonalType = List<String>.from(zonalsList
              .map((zonal) => zonal['name'])
              .where((name) => name != null)
              .toSet()
              .toList());
          log.i('Zonal names extracted: $zonalType');

          print(zonalType);
        }
      });
    } catch (e) {
      log.e('Error fetching zonal: $e');
    }
  }

  Future<void> _Addmember() async {
    setState(() {
      _isLoading = true;
    });
    var reqData = {'email': email, 'password': password, 'phone': phone};
    try {
      var response = await MemberService.Addmember(reqData);
      if (response['sts'] == '01') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('add member Success'),
        ));
      } else {
        // log.e('Login failed: ${response['msg']}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login failed: ${response['msg']}'),
        ));
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect Username and password   '),
      ));
    }
  }

  Future _PackageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');

    var response = await PackageService.ViewPackage();
    log.i('Profile data show.... $response');
    setState(() {
      packagedata = response;
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _PackageData(),
        _Memberstate(),
        // _Memberdistrict(),
        // _Memberzonal(),
        // _Memberpanchayath(),
        // _Membernotdistrict(),
        // _Membernotzonal(),
        ///////
      ],
    );
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _initLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member", style: TextStyle(color: black, fontSize: 16)),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                            style:
                                TextStyle(color: marketbgblue, fontSize: 14))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          name = text;
                        });
                      },
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child:
                          Text('Email', style: TextStyle(color: marketbgblue)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          email = text;
                        });
                      },
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Phone',
                          style: TextStyle(color: marketbgblue),
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your phone',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          phone:
                          text;
                        });
                      },
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Address',
                          style: TextStyle(color: marketbgblue),
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your address',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          // email = text;
                        });
                      },
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Date of birth',
                          style: TextStyle(color: marketbgblue),
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Enter your dob',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                        // icon: Icon(Icons.calendar_month)
                      ),
                      onChanged: (text) {
                        setState(() {
                          // email = text;
                        });
                      },
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Package Type',
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: yellow, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: yellow),
                              ),
                              hintText: 'Select Package Type',
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: marketbgblue) // Remove underline
                              ),
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20,
                          elevation: 10,
                          style: TextStyle(fontSize: 15),
                          items: packageType.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 12, color: marketbgblue),
                              ),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              packageTypedropdownvalue = newVal;
                            });
                          },
                          value: packageTypedropdownvalue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Package Name',
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: yellow, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: yellow),
                              ),
                              hintText: 'Select Package name',
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: marketbgblue) // Remove underline
                              ),
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20,
                          elevation: 10,
                          style: TextStyle(fontSize: 15),
                          items: packageName.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 12, color: marketbgblue),
                              ),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              packageNamedropdownvalue = newVal as String?;
                            });
                          },
                          value: packageNamedropdownvalue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Package Amount',
                            style:
                                TextStyle(color: marketbgblue, fontSize: 14))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Package amount',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          name = text;
                        });
                      },
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Package Amount GST',
                            style:
                                TextStyle(color: marketbgblue, fontSize: 14))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Package amount GST',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          name = text;
                        });
                      },
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: yellow, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: yellow),
                                  ),
                                  hintText: 'Select State',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: marketbgblue) // Remove underline
                                  ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: stateType.map((String state) {
                                return DropdownMenuItem<String>(
                                  value: state,
                                  child: Text(
                                    state,
                                    style:
                                        TextStyle(fontSize: 12, color: bluem),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  stateTypedropdownvalue = newVal;
                                  districtType = [];
                                  if (stateTypedropdownvalue != null) {
                                    String selectedStateId = states['states']
                                        .firstWhere((state) =>
                                            state['stateName'] ==
                                            stateTypedropdownvalue)['id'];
                                    _Memberdistrict(selectedStateId);
                                  }
                                });
                              },
                              value: stateTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Column(
                    children: [
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: yellow, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: yellow),
                                  ),
                                  hintText: 'Select District',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: marketbgblue) // Remove underline
                                  ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: stateType.map((String state) {
                                return DropdownMenuItem<String>(
                                  value: state,
                                  child: Text(
                                    state,
                                    style:
                                        TextStyle(fontSize: 12, color: bluem),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  districtTypedropdownvalue = newVal;
                                  zonalType = [];
                                  if (districtTypedropdownvalue != null) {
                                    String selectedDistrictId = districts[
                                            'districts']
                                        .firstWhere((district) =>
                                            district['name'] ==
                                            districtTypedropdownvalue)['id'];
                                    _Memberdistrict(selectedDistrictId);
                                  }
                                });
                              },
                              value: districtTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: Align(
                  //           alignment: Alignment.topLeft,
                  //           child: Text(
                  //             'District',
                  //             style: TextStyle(color: marketbgblue),
                  //           )),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: Container(
                  //         height: 45,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.all(Radius.circular(5)),
                  //         ),
                  //         child: Center(
                  //           child: DropdownButtonFormField<String>(
                  //             decoration: const InputDecoration(
                  //                 enabledBorder: OutlineInputBorder(
                  //                   borderRadius:
                  //                       BorderRadius.all(Radius.circular(10.0)),
                  //                   borderSide:
                  //                       BorderSide(color: yellow, width: 1),
                  //                 ),
                  //                 focusedBorder: OutlineInputBorder(
                  //                   borderRadius:
                  //                       BorderRadius.all(Radius.circular(10.0)),
                  //                   borderSide: BorderSide(color: yellow),
                  //                 ),
                  //                 hintText: 'Select District',
                  //                 hintStyle: TextStyle(
                  //                     fontSize: 12,
                  //                     color: marketbgblue) // Remove underline
                  //                 ),
                  //             isExpanded: true,
                  //             icon: Icon(Icons.arrow_drop_down),
                  //             iconSize: 20,
                  //             elevation: 10,
                  //             style: TextStyle(fontSize: 15),
                  //             items: districtType.map((item) {
                  //               return DropdownMenuItem<String>(
                  //                 value: item,
                  //                 child: Text(
                  //                   item,
                  //                   style: TextStyle(
                  //                       fontSize: 12, color: marketbgblue),
                  //                 ),
                  //               );
                  //             }).toList(),
                  //             onChanged: (String? newVal) {
                  //               setState(() {
                  //                 districtTypedropdownvalue = newVal;
                  //                 zonalType = [];
                  //                 if (districtTypedropdownvalue != null) {
                  //                   String selectedDistrictId = districts[
                  //                           'districts']
                  //                       .firstWhere((district) =>
                  //                           district['name'] ==
                  //                           districtTypedropdownvalue)['id'];
                  //                   _Memberzonal(selectedDistrictId);
                  //                 }
                  //               });
                  //             },
                  //             value: districtTypedropdownvalue,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 8,
                  //     ),
                  //   ],
                  // ),
                  Column(
                    children: [
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
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: yellow, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: yellow),
                                  ),
                                  hintText: 'Select Zonal',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: marketbgblue) // Remove underline
                                  ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: zonalType.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 12, color: marketbgblue),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  zonalTypedropdownvalue = newVal;
                                  panchayathType = [];
                                  if (zonalTypedropdownvalue != null) {
                                    String selectedZonalId = zonals['zonals']
                                        .firstWhere((zonal) =>
                                            zonal['name'] ==
                                            zonalTypedropdownvalue)['id'];
                                    _Memberdistrict(selectedZonalId);
                                  }
                                });
                              },
                              value: zonalTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Panchayath',
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: yellow, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: yellow),
                                  ),
                                  hintText: 'Select Panchayath',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: marketbgblue) // Remove underline
                                  ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: panchayathType.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 12, color: marketbgblue),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  panchayathTypedropdownvalue =
                                      newVal as String?;
                                });
                              },
                              value: panchayathTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(color: marketbgblue),
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(
                            color: marketbgblue, fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          // email = text;
                        });
                      },
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          _Addmember();
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
