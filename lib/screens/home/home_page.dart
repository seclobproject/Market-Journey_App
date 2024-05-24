import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../navigation/app_drawer.dart';
import '../../resources/color.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/profile_service.dart';
import '../../support/logger.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var profiledata;
  var userid;

  bool _isLoading = false;

  Future _ProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await ProfileService.profile();
    log.i('Profile data show.... $response');
    setState(() {
      profiledata = response;
    });
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _ProfileData(),
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => myHome()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/drawrwhite.svg',
                            color: black,
                            width: 17,
                            height: 17,
                          ),
                          SvgPicture.asset(
                            'assets/svg/notifications_unread.svg',
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profiledata['name'],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: marketbgblue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 40,
                      width: 400,
                      decoration: BoxDecoration(
                        color: appBlueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/verified.svg',
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Verified your profile"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("LATEST NEWS"),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 180,
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
                  ScrollLoopAutoScroll(
                    child: Text(
                      'Very long text that bleeds out of the rendering space',
                      style: TextStyle(fontSize: 13, color: marketbgblue),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: bluem,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700,
                                      color: marketbg),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Days left",
                                  style:
                                      TextStyle(fontSize: 15, color: marketbg),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Your monthly subscription plan has\n10 days to renew Subscription is 0\nPlease upload the screenshot",
                                      style: TextStyle(
                                          color: marketbg, fontSize: 12),
                                    )),
                                SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  'assets/logo/freemium.png',
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 30,
                                width: 60,
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
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 164,
                          width: 144,
                          decoration: BoxDecoration(
                              color: bluem,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset('assets/logo/walletimg1.png',
                                  fit: BoxFit.none),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "My balance",
                                      style: TextStyle(color: marketbg),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      profiledata['walletAmount'],
                                      style: TextStyle(
                                          color: marketbg,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 164,
                          width: 188,
                          decoration: BoxDecoration(
                              color: bluem,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/logo/refferpage.png',
                                height: 70,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Sharing is rewarding!\nRefer your friends and Life Time Income",
                                  style:
                                      TextStyle(fontSize: 10, color: marketbg),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 20,
                                    width: 78,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                        child: Text(
                                      "Refer Now",
                                      style: TextStyle(fontSize: 10),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          child: Divider(
                            color: black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("AWARD&REWARD"),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 150,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                        height: 111,
                        width: 400,
                        decoration: BoxDecoration(
                            color: lightyellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          color: Colors.orange,
                                          height: 65,
                                          width: 65,
                                          child: Image.network(
                                            'https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp',
                                            fit: BoxFit
                                                .cover, // Adjust the image's fit within the container
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Mrs Fathima",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          child: Divider(
                            color: black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("FLASH FEED"),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 180,
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
                                      borderRadius: BorderRadius.circular(10)),
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
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
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
