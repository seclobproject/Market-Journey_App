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
  const AddMemberPage({Key? key, required this.id, required this.name})
      : super(key: key);

  final String id;
  final String name;

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

// class _AddMemberPageState extends State<AddMemberPage> {
//   TextEditingController _dobController = TextEditingController();
//   var userid;
//   var packagedata;
//   var states;
//   // var stateId;
//   var districts;
//   // var districtId;
//   var zonals;
//   // var zonalId;
//   var panchayaths;

//   bool _isLoading = false;

//   String? name;
//   String? email;
//   int? phone;
//   int? dob;
//   String? address;
//   String? password;
//   String packageAmount = '';
//   String packageAmountGST = '';

//   List<Map<String, dynamic>> packageData = [];
//   String? packageTypedropdownvalue;
//   List<String> packageType = [];

//   String? packageNamedropdownvalue;
//   List<String> PackageName = [];

//   String? stateTypedropdownvalue;
//   List<String> stateType = [];

//   String? districtTypedropdownvalue;
//   List<String> districtType = [];

//   String? zonalTypedropdownvalue;
//   List<String> zonalType = [];

//   String? panchayathTypedropdownvalue;
//   List<String> panchayathType = [];

//   Future<void> _PackageData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userid = prefs.getString('userid');

//     try {
//       var response = await PackageService.ViewPackage();
//       log.i('Profile data show.... $response');

//       if (response != null &&
//           response['sts'] == '01' &&
//           response['msg'] == 'Packages retrieved successfully') {
//         setState(() {
//           packageData =
//               List<Map<String, dynamic>>.from(response['packageData']);

//           // Extract package types and remove duplicates
//           packageType = packageData
//               .map((packagedata) => packagedata['franchiseName'] as String)
//               .toSet()
//               .toList();
//           log.i('Package data names extracted: $packageType');
//         });
//       } else {
//         log.e('Unexpected API response: $response');
//       }
//     } catch (e) {
//       log.e('Error fetching package data: $e');
//     }
//   }

//   Future _Memberstate() async {
//     try {
//       var response = await MemberService.Memberstate();
//       log.i('State API response: $response');

//       if (response != null &&
//           response['sts'] == '01' &&
//           response['msg'] == 'States retrieved successfully') {
//         setState(() {
//           states = response;
//           stateType = List<String>.from(
//               states['states'].map((state) => state['stateName']));
//           log.i('State names extracted: $stateType');
//         });
//       } else {
//         log.e('Unexpected API response: $response');
//       }
//     } catch (e) {
//       log.e('Error fetching states: $e');
//     }
//   }

//   Future<void> _Memberdistrict(String stateId) async {
//     try {
//       var response = await MemberService.Memberdistrict(stateId);
//       log.i('District API response: $response');

//       if (response != null &&
//           response['sts'] == '01' &&
//           response['msg'] == 'Districts retrieved success') {
//         setState(() {
//           districts = response['districts'];

//           // Extract district names and remove duplicates
//           districtType = List<String>.from(
//               districts.map((district) => district['name']).toSet().toList());
//           log.i('District names extracted: $districtType');
//         });
//       } else {
//         log.e('Unexpected API response: $response');
//       }
//     } catch (e) {
//       log.e('Error fetching districts: $e');
//     }
//   }

//   Future<void> _Memberzonal(String districtId) async {
//     try {
//       var response = await MemberService.Memberzonal(districtId);
//       log.i('Zonal API response: $response');

//       if (response != null &&
//           response['sts'] == '01' &&
//           response['msg'] == 'Zonals retrieved successfully') {
//         setState(() {
//           zonals = response['zonals'];

//           // Extract zonal names and remove duplicates
//           zonalType = List<String>.from(
//               zonals.map((zonal) => zonal['name']).toSet().toList());
//           log.i('Zonal names extracted: $zonalType');
//         });
//       } else {
//         log.e('Unexpected API response: $response');
//       }
//     } catch (e) {
//       log.e('Error fetching zonals: $e');
//     }
//   }

//   Future<void> _Memberpanchayath(String zonalId) async {
//     try {
//       var response = await MemberService.Memberpanchayath(zonalId);
//       log.i('Panchayath API response: $response');

//       if (response != null &&
//           response['sts'] == '01' &&
//           response['msg'] == 'panchayaths retrieved successfully') {
//         setState(() {
//           panchayaths = response['panchayaths'];

//           // Extract Panchayath names and remove duplicates
//           panchayathType = List<String>.from(panchayaths
//               .map((panchayath) => panchayath['name'])
//               .toSet()
//               .toList());
//           log.i('Panchayath names extracted: $panchayathType');
//         });
//       } else {
//         log.e('Unexpected API response: $response');
//       }
//     } catch (e) {
//       log.e('Error fetching panchayaths: $e');
//     }
//   }

//   Future<void> _Addmember() async {
//     setState(() {
//       _isLoading = true;
//     });

//     // Construct the request data with proper conversions and null safety

//     var reqData = {
//       'name': name,
//       'email': email,
//       'phone': phone?.toString(), // Convert phone to string if not null
//       'dob': dob?.toString(), // Convert dob to string if not null
//       'address': address,
//       'password': password,
//       'packageType': packageTypedropdownvalue,
//       'packageName': packageNamedropdownvalue,

//       'packageAmount': packageAmount,
//       'packageAmountGST': packageAmountGST,
//     };

//     // Log the request data to verify its correctness
//     log.i('Request Data: $reqData');

//     try {
//       var response = await MemberService.Addmember(reqData);
//       if (response['sts'] == '01') {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Add member Success'),
//         ));
//       } else {
//         log.e('Add member failed: ${response['msg']}');
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Add member failed: ${response['msg']}'),
//         ));
//       }
//     } catch (error) {
//       log.e('Error adding member: $error');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error adding member: $error'),
//       ));
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Future<void> _Addmember() async {
//   //   setState(() {
//   //     _isLoading = true;
//   //   });
//   //   var reqData = {'email': email, 'password': password, 'phone': phone};
//   //   try {
//   //     var response = await MemberService.Addmember(reqData);
//   //     if (response['sts'] == '01') {
//   //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //         content: Text('add member Success'),
//   //       ));
//   //     } else {
//   //       // log.e('Login failed: ${response['msg']}');

//   //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //         content: Text('Login failed: ${response['msg']}'),
//   //       ));
//   //     }
//   //   } catch (error) {
//   //     setState(() {
//   //       _isLoading = false;
//   //     });

//   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //       content: Text('Incorrect Username and password   '),
//   //     ));
//   //   }
//   // }

//   // Future _Membernotdistrict() async {
//   //   var response = await MemberService.Membernotdistrict();
//   //   log.i('Profile data show.... $response');
//   //   setState(() {
//   //     packagedata = response;
//   //   });
//   // }

//   // Future<void> _Membernotzonal(String? newVal) async {
//   //   try {
//   //     var response = await MemberService.Membernotzonal();
//   //     if (response != null && response['sts'] == '01') {
//   //       setState(() {
//   //         zonalType = List<String>.from(
//   //             response['zonals'].map((zonal) => zonal['name']));

//   //         log.i('District names extracted: $zonalType');
//   //       });
//   //     } else {
//   //       log.e('Unexpected API response: $response');
//   //     }
//   //   } catch (e) {
//   //     log.e('Error fetching district data: $e');
//   //   }
//   // }

//   void _updatePackageAmountAndGST(String? newVal) {
//     setState(() {
//       packageNamedropdownvalue = newVal;

//       if (packageNamedropdownvalue != null) {
//         // Fetch the selected package data
//         var selectedPackage = packageData.firstWhere((packagedata) =>
//             packagedata['packageName'] == packageNamedropdownvalue);

//         // Set the package amount
//         packageAmount = selectedPackage['packageAmount'].toString();

//         // Calculate the GST (18%)
//         double amount = double.parse(packageAmount);
//         packageAmountGST = (amount + amount * 0.18).toStringAsFixed(2);
//       } else {
//         packageAmount = '';
//         packageAmountGST = '';
//       }
//     });
//   }

//   Future _initLoad() async {
//     await Future.wait(
//       [
//         _PackageData(),
//         _Memberstate(),
//       ],
//     );
//     _isLoading = false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _initLoad();
//     });
//   }

class _AddMemberPageState extends State<AddMemberPage> {
  TextEditingController _dobController = TextEditingController();
  var userid;
  var packagedata;
  var states;
  var districts;
  var zonals;
  var panchayaths;

  bool _isLoading = false;

  String? name;
  String? email;
  int? phone;
  int? dob;
  String? address;
  String? password;
  String packageAmount = '';
  String packageAmountGST = '';

  List<Map<String, dynamic>> packageData = [];
  String? packageTypedropdownvalue;
  List<String> packageType = [];

  String? packageNamedropdownvalue;
  List<String> PackageName = [];

  String? stateTypedropdownvalue;
  List<String> stateType = [];

  String? districtTypedropdownvalue;
  List<String> districtType = [];

  String? zonalTypedropdownvalue;
  List<String> zonalType = [];

  String? panchayathTypedropdownvalue;
  List<String> panchayathType = [];

  Future<void> _PackageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    try {
      var response = await PackageService.ViewPackage();
      log.i('Profile data show.... $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'Packages retrieved successfully') {
        setState(() {
          packageData =
              List<Map<String, dynamic>>.from(response['packageData']);

          // Extract package types and remove duplicates
          packageType = packageData
              .map((packagedata) => packagedata['franchiseName'] as String)
              .toSet()
              .toList();
          log.i('Package data names extracted: $packageType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching package data: $e');
    }
  }

  Future _Memberstate() async {
    try {
      var response = await MemberService.Memberstate();
      log.i('State API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'States retrieved successfully') {
        setState(() {
          states = response;
          stateType = List<String>.from(
              states['states'].map((state) => state['stateName']));
          log.i('State names extracted: $stateType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching states: $e');
    }
  }

  Future<void> _Memberdistrict(String stateId) async {
    try {
      var response = await MemberService.Memberdistrict(stateId);
      log.i('District API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'Districts retrieved success') {
        setState(() {
          districts = response['districts'];

          // Extract district names and remove duplicates
          districtType = List<String>.from(
              districts.map((district) => district['name']).toSet().toList());
          log.i('District names extracted: $districtType');
        });
      } else {
        log.e('Unexpected API response: $response');
      }
    } catch (e) {
      log.e('Error fetching districts: $e');
    }
  }

  Future<void> _Memberzonal(String districtId) async {
    try {
      var response = await MemberService.Memberzonal(districtId);
      log.i('Zonal API response: $response');

      if (response != null &&
          response['sts'] == '01' &&
          response['msg'] == 'Zonals retrieved successfully') {
        setState(() {
          zonals = response['zonals'];

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
          panchayaths = response['panchayaths'];

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

  Future<void> _Addmember() async {
    setState(() {
      _isLoading = true;
    });

    var reqData = {
      'name': name,
      'email': email,
      'phone': phone?.toString(), // Convert phone to string if not null
      'dob': dob?.toString(), // Convert dob to string if not null
      'address': address,
      'password': password,
      'packageType': packageTypedropdownvalue, // Ensure packageType is included
      'packageName': packageNamedropdownvalue,
      'packageAmount': packageAmount,
      'packageAmountGST': packageAmountGST,
    };

    log.i('Request Data: $reqData');

    try {
      var response = await MemberService.Addmember(reqData);
      if (response['sts'] == '01') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add member Success'),
        ));
      } else {
        log.e('Add member failed: ${response['msg']}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Add member failed: ${response['msg']}'),
        ));
      }
    } catch (error) {
      log.e('Error adding member: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding member: $error'),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _updatePackageAmountAndGST(String? newVal) {
    setState(() {
      packageNamedropdownvalue = newVal;

      if (packageNamedropdownvalue != null) {
        // Fetch the selected package data
        var selectedPackage = packageData.firstWhere((packagedata) =>
            packagedata['packageName'] == packageNamedropdownvalue);

        // Set the package amount
        packageAmount = selectedPackage['packageAmount'].toString();

        // Calculate the GST (18%)
        double amount = double.parse(packageAmount);
        packageAmountGST = (amount + amount * 0.18).toStringAsFixed(2);
      } else {
        packageAmount = '';
        packageAmountGST = '';
      }
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _PackageData(),
        _Memberstate(),
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
                      keyboardType: TextInputType.phone,
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
                          phone = int.tryParse(
                              text); // Convert the input to an integer
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
                          address = text;
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
                      controller: _dobController,
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          hintText: 'Enter your dob',
                          hintStyle: TextStyle(
                              color: marketbgblue, fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          suffixIcon: Icon(Icons.calendar_month)
                          // icon: Icon(Icons.calendar_month)
                          ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            dob = pickedDate
                                .millisecondsSinceEpoch; // Save the date as an integer (timestamp)
                            _dobController.text =
                                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"; // Format the date and display it
                          });
                        }
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
                      child: Text('Package Type',
                          style: TextStyle(color: marketbgblue)),
                    ),
                  ),
                  SizedBox(height: 10),
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
                              borderSide: BorderSide(color: yellow, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: yellow),
                            ),
                            hintText: 'Select Package Type',
                            hintStyle:
                                TextStyle(fontSize: 12, color: marketbgblue),
                          ),
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20,
                          elevation: 10,
                          style: TextStyle(fontSize: 15),
                          items: packageType.map((String packagedata) {
                            return DropdownMenuItem<String>(
                              value: packagedata,
                              child: Text(
                                packagedata,
                                style: TextStyle(
                                    fontSize: 12, color: marketbgblue),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              packageTypedropdownvalue = newVal;
                              packageNamedropdownvalue = null;
                              packageAmount = '';
                              packageAmountGST = '';
                              if (packageTypedropdownvalue != null) {
                                // Filter package names based on selected package type
                                PackageName = packageData
                                    .where((packagedata) =>
                                        packagedata['franchiseName'] ==
                                        packageTypedropdownvalue)
                                    .map((packagedata) =>
                                        packagedata['packageName'] as String)
                                    .toList();
                              } else {
                                PackageName = [];
                              }
                            });
                          },
                          value: packageTypedropdownvalue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Package Name',
                          style: TextStyle(color: marketbgblue)),
                    ),
                  ),
                  SizedBox(height: 10),
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
                              borderSide: BorderSide(color: yellow, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: yellow),
                            ),
                            hintText: 'Select Package Name',
                            hintStyle:
                                TextStyle(fontSize: 12, color: marketbgblue),
                          ),
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20,
                          elevation: 10,
                          style: TextStyle(fontSize: 15),
                          items: PackageName.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 12, color: marketbgblue),
                              ),
                            );
                          }).toList(),
                          onChanged: _updatePackageAmountAndGST,
                          value: packageNamedropdownvalue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Package Amount',
                        style: TextStyle(color: bluem, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Package amount',
                        hintStyle: TextStyle(
                            color: bluem, fontWeight: FontWeight.w400),
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
                          packageAmount = text;
                        });
                      },
                      style: TextStyle(
                          color: bluem,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      controller: TextEditingController(text: packageAmount),
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
                      readOnly: true,
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
                          color: bluem,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      controller: TextEditingController(text: packageAmountGST),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(children: [
                    if (packageNamedropdownvalue == 'District Franchise' ||
                        packageNamedropdownvalue == 'Zonal Franchise' ||
                        packageNamedropdownvalue == 'Mobile Franchise' ||
                        packageTypedropdownvalue == 'Courses' ||
                        packageTypedropdownvalue == 'Signals') ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'State',
                            style: TextStyle(color: bluem),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                hintText: 'Select State',
                                hintStyle:
                                    TextStyle(fontSize: 12, color: bluem),
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
                                  districtTypedropdownvalue = null;
                                  zonalTypedropdownvalue = null;
                                  districtType = [];
                                  zonalType = [];
                                  if (stateTypedropdownvalue != null) {
                                    // Find the state ID corresponding to the selected state name
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
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'District',
                            style: TextStyle(color: bluem),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                hintText: 'Select District',
                                hintStyle:
                                    TextStyle(fontSize: 12, color: bluem),
                              ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: districtType.map((String district) {
                                return DropdownMenuItem<String>(
                                  value: district,
                                  child: Text(
                                    district,
                                    style:
                                        TextStyle(fontSize: 12, color: bluem),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  districtTypedropdownvalue = newVal;
                                  zonalTypedropdownvalue = null;
                                  zonalType = [];
                                  if (districtTypedropdownvalue != null) {
                                    // Find the district ID corresponding to the selected district name
                                    String selectedDistrictId =
                                        districts.firstWhere((district) =>
                                            district['name'] ==
                                            districtTypedropdownvalue)['id'];
                                    _Memberzonal(selectedDistrictId);
                                  }
                                });
                              },
                              value: districtTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                    ],
                    if (packageNamedropdownvalue == 'Zonal Franchise' ||
                        packageNamedropdownvalue == 'Mobile Franchise' ||
                        packageTypedropdownvalue == 'Courses' ||
                        packageTypedropdownvalue == 'Signals') ...[
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Zonal',
                            style: TextStyle(color: bluem),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                hintStyle:
                                    TextStyle(fontSize: 12, color: bluem),
                              ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: zonalType.map((String zonal) {
                                return DropdownMenuItem<String>(
                                  value: zonal,
                                  child: Text(
                                    zonal,
                                    style:
                                        TextStyle(fontSize: 12, color: bluem),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  zonalTypedropdownvalue = newVal;
                                  panchayathTypedropdownvalue = null;
                                  panchayathType = [];
                                  if (zonalTypedropdownvalue != null) {
                                    // Find the zonal ID corresponding to the selected zonal name
                                    String selectedZonalId = zonals.firstWhere(
                                        (zonal) =>
                                            zonal['name'] ==
                                            zonalTypedropdownvalue)['id'];
                                    _Memberpanchayath(selectedZonalId);
                                  }
                                });
                              },
                              value: zonalTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                    ],
                    if (packageNamedropdownvalue == 'Mobile Franchise' ||
                        packageTypedropdownvalue == 'Courses' ||
                        packageTypedropdownvalue == 'Signals') ...[
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Panchayath',
                            style: TextStyle(color: bluem),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                hintText: 'Select Panchayath',
                                hintStyle:
                                    TextStyle(fontSize: 12, color: bluem),
                              ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              elevation: 10,
                              style: TextStyle(fontSize: 15),
                              items: panchayathType.map((String panchayath) {
                                return DropdownMenuItem<String>(
                                  value: panchayath,
                                  child: Text(
                                    panchayath,
                                    style:
                                        TextStyle(fontSize: 12, color: bluem),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  panchayathTypedropdownvalue = newVal;
                                });
                              },
                              value: panchayathTypedropdownvalue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ]),
                  const SizedBox(
                    height: 10,
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
                          password = text;
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
