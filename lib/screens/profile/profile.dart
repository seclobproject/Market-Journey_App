import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/color.dart';

import '../../services/profile_service.dart';
import '../../support/logger.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override





  var profiledata;
  bool _isLoading = true;

  Future _ProfileData() async {
    var response = await ProfileService.profile();
    log.i('Profile data show.... $response');
    setState(() {
      profiledata = response;
      _isLoading = false;
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _ProfileData(),
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

  Widget build(BuildContext context) {
    int   isSelectedIndex = -1;
    double gstAmount = profiledata['packageAmount'] * 0.18;

    double totalAmount = profiledata['packageAmount'] + gstAmount ;

    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bluem,
        appBar: AppBar(
            title: Text("Profile",
                style: TextStyle(
                    color: marketbg,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            centerTitle: true,
            backgroundColor: bluem),
        body:
        _isLoading
            ? Center(child: CircularProgressIndicator()):SizedBox(
            child: Container(
                child: SingleChildScrollView(
          child: Stack(children: [
            Column(children: [
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 170,
                            height: 86,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(221, 228, 235, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(19),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/cash.svg'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(children: [
                                    Text("text",
                                      // ₹${profiledata['directIncome']}' ?? ""
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11),
                                    ),
                                    Text('Direct Income')
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 170,
                            height: 86,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(221, 228, 235, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(19),
                              child: Row(
                                children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/cash.svg',
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(children: [
                                    Text(
                                        // '₹${profiledata['inDirectIncome']}' ??
                                            "text",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11)),
                                    Text('InDirect Income')
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 168,
                            height: 86,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(221, 228, 235, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(19),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/cash.svg',
                                    width: 17,
                                    height: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(children: [
                                    Text('₹${profiledata['totalLevelIncome']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11)),
                                    Text('Level Income')
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]);
                    }),
              ),


              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                    color: marketbg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: Column(children: [
                  SizedBox(
                    height: 110,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedIndex = 0;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 21),
                            height: 29,
                            width: 115,
                            decoration: BoxDecoration(
                              border: Border.all(color: yellow1, width: 1),
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  isSelectedIndex == 0 ? yellow : Colors.white,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Certificate',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset('assets/svg/up_arrow.svg'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedIndex = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 37),
                            height: 29,
                            width: 115,
                            decoration: BoxDecoration(
                              border: Border.all(color: yellow1, width: 1),
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  isSelectedIndex == 1 ? yellow : Colors.white,
                            ),
                            child: Text(
                              'Invoice',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  isSelectedIndex == -1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/mail_icon.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Email : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['email']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/phone.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Phone : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['phone']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/location.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Address :  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['address']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/user_id.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'User ID : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['ownSponserId']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/user_id.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Package Amount : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['packageAmount']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/amount.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Franchise Name : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['franchiseName']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/edit.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Package Type :  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['packageType']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/user_id.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Wallet Amount : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['walletAmount']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/rank.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Pool Rank : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${profiledata['pool']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: marketbgblue),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : isSelectedIndex == 0
                          ? Container(child: Text('Certificate'))
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 24),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/barcode.svg',
                                        height: 26,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/logo.svg',
                                        height: 56,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '(+91)',
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Marketjourney.com',
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '1st Floor Hibon Plaza Mavoor Road',
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  Text(
                                    'INVOICE',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 21),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 6),
                                    height: 24,
                                    width: double.infinity,
                                    decoration: BoxDecoration(color: whitegray),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Package Type',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: marketbgblue),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Package',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: marketbgblue),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: marketbgblue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),

                                  Row(
                                    children: [
                                      Text(
                                        profiledata['packageType'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                      Spacer(),
                                      Text(
                                        profiledata['franchise'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${profiledata['packageAmount']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                       Text(
                                            'GST',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 9,
                                                color: marketbgblue),
                                          ),

                                     
                                      SizedBox(width: 79),
                                       Text(
                                          '18%',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9,
                                              color: marketbgblue),
                                        ),
                                     
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'GST Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 79),
                                      Text(
                                        '$gstAmount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'Package Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                      SizedBox(width: 49),
                                      Text(
                                        '${profiledata['packageAmount']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: marketbgblue),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 17),
                                  Divider(),
                                  SizedBox(height: 14),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 2),
                                    height: 24,
                                    width: double.infinity,
                                    decoration: BoxDecoration(color: whitegray),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: marketbgblue),
                                        ),
                                        Spacer(),
                                        Text(
                                          '₹ $totalAmount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: marketbgblue),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 47),
                                  Row(
                                    children: [
                                      Text(
                                        'Name: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: black),
                                      ),
                                      Text(
                                        profiledata['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        'Contact: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: black),
                                      ),
                                      Text(
                                        profiledata['phone'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        'Email: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: black),
                                      ),
                                      Text(
                                        profiledata['email'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                ]),
              )
            ]),
            // Positioned(
            //     top: height * 0.24,
            //     left: width * 0.5 - 40,
            //
            //
            //     child: Column(
            //       children: [
            //         CircleAvatar(
            //             backgroundColor: marketbg,
            //             radius: 40,
            //             child: CircleAvatar(
            //               backgroundColor: Colors.black,
            //               radius: 35,
            //             )),
            //         Text(
            //           profiledata['name'],
            //           style:
            //               TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            //         ),
            //         SizedBox(
            //           height: 4,
            //         ),
            //         Text(
            //           profiledata['userStatus'],
            //           style: TextStyle(
            //               fontSize: 13,
            //               fontWeight: FontWeight.w500,
            //               color: greendark),
            //         ),
            //       ],
            //     ))

              Positioned(
              top: height * 0.24,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: marketbg,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 35,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      profiledata['name'] ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      profiledata['userStatus'] ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: greendark,
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ])))));
  }
}
