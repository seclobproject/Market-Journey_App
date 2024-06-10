import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/bank_service.dart';
import '../../../services/profile_service.dart';
import '../../../support/logger.dart';

class Nomineeaccount extends StatefulWidget {
  const Nomineeaccount({super.key});

  @override
  State<Nomineeaccount> createState() => _NomineeaccountState();
}

class _NomineeaccountState extends State<Nomineeaccount> {
  String? userId;
  bool _isLoading = false;
  bool _isEditing = false;

  String? name;
  int? phone;
  String? Address;
  int? pancard;
  int? adhaar;
  int? accountNum;
  String? bankName;
  String? ifscCode;

  @override
  void initState() {
    super.initState();
    _fetchBankDetails();
  }

  Future<void> _fetchBankDetails() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var response = await ProfileService.profile();
      if (response['sts'] == '01') {
        var nomineeDetails = response['nomineeDetails'];
        setState(() {
          name = nomineeDetails['holderName'];
          phone = int.tryParse(nomineeDetails['phone']);
          Address = nomineeDetails['address'];
          adhaar = int.tryParse(nomineeDetails['aadhaar2']);
          bankName = nomineeDetails['bankName'];
          accountNum = int.tryParse(nomineeDetails['accountNum']);
          ifscCode = nomineeDetails['ifscCode'];
        });
      } else {
        log.e('Fetch bank details failed: ${response['msg']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Fetch bank details failed: ${response['msg']}')),
        );
      }
    } catch (error) {
      log.e('Error fetching bank details: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching bank details: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _Nominee() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userid');
    setState(() {
      _isLoading = true;
    });

    if (name == null ||
        name!.isEmpty ||
        phone == null ||
        phone.toString().isEmpty ||
        Address == null ||
        Address!.isEmpty ||
        pancard == null ||
        pancard.toString().isEmpty ||
        adhaar == null ||
        adhaar.toString().isEmpty ||
        bankName == null ||
        bankName!.isEmpty ||
        accountNum == null ||
        accountNum.toString().isEmpty ||
        ifscCode == null ||
        ifscCode!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields are required')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var reqData = {
      'name': name,
      'phone': phone.toString(),
      'address': Address,
      'pancard': pancard.toString(),
      'aadhaar2': adhaar.toString(),
      'bankName': bankName,
      'accountNum': accountNum.toString(),
      'ifscCode': ifscCode,
    };
    log.i('Request Data: $reqData');
    try {
      var response = await BankService.Nominee(reqData);
      if (response['sts'] == '01') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bank data added successfully')),
        );
      } else {
        log.e('Add bank failed: ${response['msg']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Add bank failed: ${response['msg']}')),
        );
      }
    } catch (error) {
      log.e('Error adding bank: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding bank: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
        _isEditing = false;
      });
    }
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _Nominee(),
      ],
    );
    _isLoading = false;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _initLoad();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onChanged: (text) {
                  setState(() {
                    accountNum = int.tryParse(text);
                  });
                },
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
                  child: Text('Phone',
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
                onChanged: (text) {
                  setState(() {
                    accountNum = int.tryParse(text);
                  });
                },
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Adhaar Number',
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
                onChanged: (text) {
                  setState(() {
                    accountNum = int.tryParse(text);
                  });
                },
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
                  child: Text('Pancard Number',
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
                onChanged: (text) {
                  setState(() {
                    accountNum = int.tryParse(text);
                  });
                },
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
                  child: Text('Bank Name',
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Account Number',
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
                onChanged: (text) {
                  setState(() {
                    accountNum = int.tryParse(text);
                  });
                },
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
                  child: Text('IFSC Code',
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
