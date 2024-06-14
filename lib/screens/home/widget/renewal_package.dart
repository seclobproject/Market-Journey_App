import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_journey/services/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../../../resources/color.dart';
import '../../../services/profile_service.dart';
import '../../../support/logger.dart';

class Renewalpackage extends StatefulWidget {
  const Renewalpackage({super.key});

  @override
  State<Renewalpackage> createState() => _RenewalpackageState();
}

class _RenewalpackageState extends State<Renewalpackage> {
  var userid;
  List<dynamic> renewalPackage = [];
  XFile? _imageFile;

  Future<void> _viewpak() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var response = await homeservice.viewRenewalpackage();
      log.i('Profile data show.... $response');
      setState(() {
        renewalPackage = response['renewPackages'] ?? [];
      });
    } catch (error) {
      log.e('Error fetching subscription history data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _viewpak();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _showPackageDetails(BuildContext context, dynamic transaction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Renewal Package'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(transaction['packageName'] ?? 'No Name'),
              Text("Package Amount: ₹${transaction['packageAmount'] ?? '0'}"),
              SizedBox(height: 20),
              _imageFile == null
                  ? Text("No image selected.")
                  : Image.file(File(_imageFile!.path)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text("Upload Screenshot"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenOrientation = MediaQuery.of(context).orientation;
    bool isPortrait = screenOrientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Renewal Package ',
          style: TextStyle(color: black, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Renewal Signals",
                    style: TextStyle(
                      color: Color(0xff163A56),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: renewalPackage.length,
                  itemBuilder: (BuildContext context, int index) {
                    var transaction = renewalPackage[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: GestureDetector(
                        onTap: () => _showPackageDetails(context, transaction),
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: BoxDecoration(
                            color: bluem,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transaction['packageName'] ?? 'No Name',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: marketbg,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "₹${transaction['packageAmount'] ?? '0'}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: marketbg,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
