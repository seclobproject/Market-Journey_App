// import 'package:flutter/material.dart';
// import 'package:master_journey/services/bank_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../resources/color.dart';
// import '../../../support/logger.dart';

// class Bankaccount extends StatefulWidget {
//   const Bankaccount({super.key});

//   @override
//   State<Bankaccount> createState() => _BankaccountState();
// }

// class _BankaccountState extends State<Bankaccount> {
//   var userid;
//   var updatedUser;

//   bool _isLoading = false;

//   String? name;
//   String? bankname;
//   int? accountNum;
//   String? ifscCode;

//   Future<void> _Addbank() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     userid = prefs.getString('userid');
//     // var response = await BankService.Addbank();
//     // log.i('Profile data show.... $response');
//     setState(() {
//       _isLoading = true;
//     });

//     // Validate required fields
//     if (name == null ||
//         name!.isEmpty ||
//         bankname == null ||
//         bankname!.isEmpty ||
//         accountNum == null ||
//         accountNum.toString().isEmpty ||
//         ifscCode == null ||
//         ifscCode!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('All fields are required'),
//       ));
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }
//     var reqData = {
//       'holderName': name,
//       'bankName': bankname,
//       'accountNum':
//           accountNum?.toString(), // Convert phone to string if not null
//       'ifscCode': ifscCode?.toString(), // Convert dob to string if not null
//     };
//     log.i('Request Data: $reqData');
//     try {
//       var response = await BankService.Addbank(reqData);
//       if (response['sts'] == '01') {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Bank data added successfully'),
//         ));
//       } else {
//         log.e('Add bank failed: ${response['msg']}');
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Add bank failed: ${response['msg']}'),
//         ));
//       }
//     } catch (error) {
//       log.e('Error adding bank: $error');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error adding bank: $error'),
//       ));
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: marketbg,
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text('Name',
//                             style:
//                                 TextStyle(color: marketbgblue, fontSize: 14))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           name = text;
//                         });
//                       },
//                       style: TextStyle(
//                           color: black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text('Bank Name',
//                             style:
//                                 TextStyle(color: marketbgblue, fontSize: 14))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           bankname = text;
//                         });
//                       },
//                       style: TextStyle(
//                           color: black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text('Account Number',
//                             style:
//                                 TextStyle(color: marketbgblue, fontSize: 14))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           accountNum = int.tryParse(
//                               text); // Convert the input to an integer
//                         });
//                       },
//                       style: TextStyle(
//                           color: black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text('IFSC Code',
//                             style:
//                                 TextStyle(color: marketbgblue, fontSize: 14))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: yellow, width: 2),
//                         ),
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           ifscCode = text; // Convert the input to an integer
//                         });
//                       },
//                       style: TextStyle(
//                           color: black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: GestureDetector(
//                         onTap: () {
//                           _Addbank();
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 400,
//                           decoration: BoxDecoration(
//                               color: yellow,
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Center(
//                               child: Text(
//                             'Submit',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w500),
//                           )),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   )
//                 ],
//               ),
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:master_journey/services/bank_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/profile_service.dart';
import '../../../support/logger.dart';

class Bankaccount extends StatefulWidget {
  const Bankaccount({Key? key}) : super(key: key);

  @override
  _BankaccountState createState() => _BankaccountState();
}

class _BankaccountState extends State<Bankaccount> {
  var bankDetails;

  String? userId;
  bool _isLoading = false;
  bool _isEditing = false;

  String? name;
  String? bankName;
  int? accountNum;
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
        var bankDetails = response['bankDetails'];
        setState(() {
          name = bankDetails['holderName'];
          bankName = bankDetails['bankName'];
          accountNum = int.tryParse(bankDetails['accountNum']);
          ifscCode = bankDetails['ifscCode'];
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

  Future<void> _addBank() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userid');
    setState(() {
      _isLoading = true;
    });

    if (name == null ||
        name!.isEmpty ||
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
      'holderName': name,
      'bankName': bankName,
      'accountNum': accountNum.toString(),
      'ifscCode': ifscCode,
    };
    log.i('Request Data: $reqData');
    try {
      var response = await BankService.Addbank(reqData);
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

  Widget _buildTextField({
    required String label,
    required String hintText,
    required ValueChanged<String> onChanged,
    String? initialValue,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: marketbgblue, fontSize: 14),
          ),
          SizedBox(height: 10),
          TextField(
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
              hintText: hintText,
            ),
            controller: TextEditingController(text: initialValue),
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: TextStyle(
                color: black, fontSize: 12, fontWeight: FontWeight.w400),
            enabled: enabled,
          ),
        ],
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
                children: [
                  SizedBox(height: 10),
                  _buildTextField(
                    label: 'Name',
                    hintText: 'Enter your name',
                    onChanged: (text) {
                      setState(() {
                        name = text;
                      });
                    },
                    initialValue: name,
                    enabled: _isEditing,
                  ),
                  _buildTextField(
                    label: 'Bank Name',
                    hintText: 'Enter your bank name',
                    onChanged: (text) {
                      setState(() {
                        bankName = text;
                      });
                    },
                    initialValue: bankName,
                    enabled: _isEditing,
                  ),
                  _buildTextField(
                    label: 'Account Number',
                    hintText: 'Enter your account number',
                    onChanged: (text) {
                      setState(() {
                        accountNum = int.tryParse(text);
                      });
                    },
                    initialValue: accountNum?.toString(),
                    keyboardType: TextInputType.number,
                    enabled: _isEditing,
                  ),
                  _buildTextField(
                    label: 'IFSC Code',
                    hintText: 'Enter your IFSC code',
                    onChanged: (text) {
                      setState(() {
                        ifscCode = text;
                      });
                    },
                    initialValue: ifscCode,
                    enabled: _isEditing,
                  ),
                  SizedBox(height: 30),
                  _isEditing
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: _addBank,
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isEditing = true;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 30),
                ],
              ),
            ),
    );
  }
}
