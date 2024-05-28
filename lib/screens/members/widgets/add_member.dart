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
  const AddMemberPage({Key? key}) : super(key: key);

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {

var userid;
  var packagedata;


  bool _isLoading = false;
  String? name;
  String? email;
  int? phone;
  int? dob;
  String? password;

  String? packageTypedropdownvalue;
  List packageType = ['Franchise', 'Courses', 'Signals'];

  String? packageNamedropdownvalue;
  Map<String, List<String>> packMap = {
    'Franchise': ['District Franchise', 'Zonal Franchise', 'Mobile Franchise'],
  };
  List packageName = [];
  

  String? stateTypedropdownvalue;
  List stateType = ['Kerala'];
  String? districtTypedropdownvalue;
  Map<String, List<String>> districtMap = {
    'Kerala': ['Kozhikode', 'Ernakulam'],
  };
  List districtType = [];
  String? zonalTypedropdownvalue;
  Map<String, List<String>> zonalMap = {
    'Kozhikode': ['test1', 'test2'],
    'Ernakulam': ['test3', 'test4']
  };
  List zonalType = [];
  String? panchayathTypedropdownvalue;
  Map<String, List<String>> panchMap = {
    'test1': ['item1', 'item2'],
    'test2': ['item3', 'item4'],
    'test3': ['item5', 'item6'],
    'test4': ['item7', 'item8']
  };
  List panchayathType = [];

  // @override
  // void initState() {
  //   super.initState();
  //   packageTypedropdownvalue = packageType[0]; // Set the initial value here
  //   franchiseTypedropdownvalue = franchiseType[0];

  //   zonalTypedropdownvalue = zonalType[0];
  // }

// uture _getstates() async {
//   var response = await LeadService.LeadPageStates();
//   log.i('state list.. $response');
//   setState(() {
//     statelead = response['states'];
//   });
// }

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
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Email', style: TextStyle(color: marketbgblue)),
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
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
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
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
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
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
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
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          style: TextStyle(fontSize: 12, color: marketbgblue),
                        ),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        packageTypedropdownvalue = newVal as String?;
                        packageName = packMap[newVal] ?? [];
                        packageNamedropdownvalue = null;
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: yellow, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          style: TextStyle(fontSize: 12, color: marketbgblue),
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
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
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
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
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
            Visibility(
              visible: packageNamedropdownvalue == 'District Franchise' ||
                  packageNamedropdownvalue == 'Mobile Franchise' ||
                  packageNamedropdownvalue == 'Zonal Franchise' ||
                  packageTypedropdownvalue == 'Courses' ||
                  packageTypedropdownvalue == 'Signals',
              child: Column(
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
                                borderSide: BorderSide(color: yellow, width: 1),
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
                          items: stateType.map((item) {
                            return DropdownMenuItem<String>(
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
                              stateTypedropdownvalue = newVal as String?;
                              districtType = districtMap[newVal] ?? [];
                              districtTypedropdownvalue = null;
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
            ),
            Visibility(
              visible: packageNamedropdownvalue == 'District Franchise' ||
                  packageNamedropdownvalue == 'Mobile Franchise' ||
                  packageNamedropdownvalue == 'Zonal Franchise' ||
                  packageTypedropdownvalue == 'Courses' ||
                  packageTypedropdownvalue == 'Signals',
              child: Column(
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
                                borderSide: BorderSide(color: yellow, width: 1),
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
                          items: districtType.map((item) {
                            return DropdownMenuItem<String>(
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
                              districtTypedropdownvalue = newVal as String?;
                              zonalType = zonalMap[newVal] ?? [];
                              zonalTypedropdownvalue = null;
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
            ),
            Visibility(
              visible: packageNamedropdownvalue == 'Mobile Franchise' ||
                  packageNamedropdownvalue == 'Zonal Franchise' ||
                  packageTypedropdownvalue == 'Courses' ||
                  packageTypedropdownvalue == 'Signals',
              child: Column(
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
                              zonalTypedropdownvalue = newVal as String?;
                              panchayathType = panchMap[newVal] ?? [];
                              panchayathTypedropdownvalue = null;
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
            ),
            Visibility(
              visible: packageNamedropdownvalue == 'Mobile Franchise' ||
                  packageTypedropdownvalue == 'Courses' ||
                  packageTypedropdownvalue == 'Signals',
              child: Column(
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
                                borderSide: BorderSide(color: yellow, width: 1),
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
                              panchayathTypedropdownvalue = newVal as String?;
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
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Align(
            //       alignment: Alignment.topLeft,
            //       child: Text('Package Type',style: TextStyle(color: marketbgblue),)),
            // ),

            // SizedBox(height: 8,),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: DropdownButton(
            //
            //     onChanged: (text) {
            //       setState(() {
            //         // email = text;
            //       });
            //     },
            //     style: TextStyle(color: black, fontSize: 12,fontWeight: FontWeight.w400),
            //   ),
            // ),
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
                        color: yellow, borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
