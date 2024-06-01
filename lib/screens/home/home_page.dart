import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_journey/screens/home/widget/latestnews.dart';
import 'package:master_journey/screens/home/widget/notification.dart';
import 'package:master_journey/screens/home/widget/subscription.dart';
import '../../navigation/app_drawer.dart';
import '../../resources/color.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/home_service.dart';
import '../../services/profile_service.dart';
import '../../support/logger.dart';
import '../profile/profile.dart';
import 'widget/flashfeed.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var userid;
  var profiledata;
  var awardData;
  bool _isLoading = true;

  Future _ProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await ProfileService.profile();
    log.i('Profile data show.... $response');
    setState(() {
      profiledata = response;
    });
  }

  Future _AwardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await AwardService.viewRewards();
    log.i('Award & Reward data show.... $response');
    return response ?? []; // return the loaded data
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _ProfileData(),
        _AwardData(),
        ///////
      ],
    );
    setState(() {
      _isLoading = false;
    });
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: marketbg,
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        drawer: appdrawer(),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  valueColor: AlwaysStoppedAnimation(yellow),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.02),
                      child: GestureDetector(
                        // onTap: () {
                        //   _scaffoldKey.currentState?.openDrawer();
                        //   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => myHome()));
                        // },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState?.openDrawer();
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => home()));
                              },
                              child: SvgPicture.asset(
                                'assets/svg/drawrwhite.svg',
                                color: black,
                                width: screenWidth * 0.03,
                                height: screenHeight * 0.03,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Notificationscreen()),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/svg/notifications_unread.svg',
                                width: screenWidth * 0.04,
                                height: screenHeight * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.02),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello ${profiledata['name']}',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: marketbgblue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          color: appBlueColor,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.025),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/verified.svg',
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Verified your profile"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.01,
                            child: Divider(
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text("LATEST NEWS"),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          SizedBox(
                            width: screenWidth * 0.57,
                            child: Divider(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: ScrollLoopAutoScroll(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Latestnews()),
                            );
                          },
                          child: Text(
                            'Very long text that bleeds out of the rendering space',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: marketbgblue),
                          ),
                        ),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: EdgeInsets.only(left: 9, right: 6),
                        width: 400,
                        height: 180,
                        decoration: BoxDecoration(
                          color: bluem,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: marketbg),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Days left",
                                      style: TextStyle(
                                          fontSize: 15, color: marketbg),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Your monthly subscription plan has 10 days to renew Subscription is 0m Please upload the screenshot",
                                    style: TextStyle(
                                        color: marketbg,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 19,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    'assets/logo/freemium.png',
                                    height: 83,
                                    width: 83,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Subscription()),
                                  );
                                },
                                child: Container(
                                  height: 26,
                                  width: 52,
                                  decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Click',
                                    style: TextStyle(fontSize: 10),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 162,
                            width: 132, // Adjust the width as per requirement
                            decoration: BoxDecoration(
                              color: bluem,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.025),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Image.asset(
                                  'assets/logo/walletimg1.png',
                                  fit: BoxFit.none,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "My balance",
                                      style: TextStyle(
                                        color: marketbg,
                                        fontSize: screenWidth *
                                            0.03, // Adjust the font size as per requirement
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      profiledata['walletAmount'],
                                      style: TextStyle(
                                        color: marketbg,
                                        fontSize: screenWidth *
                                            0.06, // Adjust the font size as per requirement
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 34),
                          Container(
                            height: 165, // Adjust the height as per requirement
                            width: 176, // Adjust the width as per requirement
                            decoration: BoxDecoration(
                              color: bluem,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.025),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Image.asset(
                                  'assets/logo/refferpage.png',
                                  height: screenHeight * 0.1,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.04),
                                    child: Text(
                                      "Sharing is rewarding!\nRefer your friends and Life Time Income",
                                      style: TextStyle(
                                        fontSize: screenWidth *
                                            0.03, // Adjust the font size as per requirement
                                        fontWeight: FontWeight.w400,
                                        color: marketbg,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: screenHeight * 0.03,
                                      width: screenWidth * 0.2,
                                      decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 0.01),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Refer Now",
                                          style: TextStyle(
                                            fontSize: screenWidth *
                                                0.03, // Adjust the font size as per requirement
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                            child: Divider(
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text(
                            "Award Rewards  ",
                            style: TextStyle(
                                fontSize:
                                    screenWidth * 0.04), // Adjust font size
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: Divider(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 111,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: yellow),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        color: Colors.orange,
                                        height: 61,
                                        width: 61,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(left: screenWidth * 0.05),
                    //   child:
                    //   Container(
                    //     height: 111,
                    //     width: 400,
                    //     decoration: BoxDecoration(
                    //       color: lightyellow,
                    //       borderRadius: BorderRadius.all(
                    //           Radius.circular(screenWidth * 0.025)),
                    //     ),
                    //     child:
                    //     FutureBuilder(
                    //       future: _AwardData(),
                    //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    //         if (snapshot.connectionState == ConnectionState.waiting) {
                    //           return CircularProgressIndicator(); // show a loader while data is loading
                    //         } else if (snapshot.hasError) {
                    //           return Text('Error: ${snapshot.error}'); // display an error message
                    //         } else {
                    //           if (snapshot.data == null) {
                    //             return Text('No data available'); // or some other default message
                    //           } else {
                    //             return ListView.builder(
                    //               scrollDirection: Axis.horizontal,
                    //               itemCount: snapshot.data.length,
                    //               itemBuilder: (BuildContext context, int index) {
                    //                 if (awardData[index] == null) {
                    //                   return Container(); // or some other default widget
                    //                 } else {
                    //                   return Row(
                    //                     children: [
                    //                       Padding(
                    //                         padding: EdgeInsets.symmetric(
                    //                           horizontal: screenWidth * 0.025,
                    //                           vertical: screenHeight * 0.02,
                    //                         ),
                    //                         child: Column(
                    //                           children: [
                    //                             ClipOval(
                    //                               child: Container(
                    //                                 color: Colors.orange,
                    //                                 height: 61,
                    //                                 width: 61,
                    //                                 child: Image.network(
                    //                                   awardData[index]['memberImage']?? '',
                    //                                   fit: BoxFit.cover, // Adjust the image's fit within the container
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                             Text(
                    //                               awardData[index]['memberName']?? 'No Name',
                    //                               style: TextStyle(
                    //                                 fontSize: screenWidth * 0.03, // Adjust font size
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   );
                    //                 }
                    //               },
                    //             );
                    //           }
                    //         }
                    //       },
                    //     )
                    //   ),
                    // ),

                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                            child: Divider(
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text(
                            "Leader Boards  ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.w600), // Adjust font size
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: Divider(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 20),
                                width: 170,
                                height: 88,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: marketbgblue),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Team Leader(A)',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: marketbg),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Member’s',
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: marketbg),
                                          ),
                                          SizedBox(width: 38),
                                          Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: marketbg),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 13),
                                            height: 25,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: yellow1,
                                            ),
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          SizedBox(width: 49),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 13),
                                            height: 25,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: yellow1,
                                            ),
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                            child: Divider(
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text(
                            "Distributed Leader Boards  ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.w600), // Adjust font size
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: Divider(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 20),
                                width: 170,
                                height: 88,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: marketbgblue),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Team Leader(A)',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: marketbg),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Member’s',
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: marketbg),
                                          ),
                                          SizedBox(width: 38),
                                          Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: marketbg),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 13),
                                            height: 25,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: yellow1,
                                            ),
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          SizedBox(width: 49),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 13),
                                            height: 25,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: yellow1,
                                            ),
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.03,
                            child: Divider(
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Text(
                            "FLASH FEED ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.w600), // Adjust font size
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          SizedBox(
                            width: screenWidth * 0.62,
                            child: Divider(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 81,
                                    width: 122,
                                    decoration: BoxDecoration(
                                        color: bottomtabbg,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      // Adjust the value as per your preference
                                      child: Image.network(
                                        'https://i.insider.com/6247782ae22adb0018d1b640?width=700',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Journey of inspiration\nand discovery",
                                    style: TextStyle(
                                        fontSize: 10,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Flashfeed()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          // This is the container for the image
                                          height: 81,
                                          width: 122,
                                          decoration: BoxDecoration(
                                            color: bottomtabbg,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_the_Importance_of_Technology.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        // This is the container for aligning at the top right corner
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            height: 20,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: yellow,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "New",
                                              style: TextStyle(fontSize: 10),
                                            )),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }
}
