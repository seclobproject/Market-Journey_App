import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 16)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                          children:[ Padding(
                            padding: const EdgeInsets.all(8.0),

                            child:  Container(
                              width: 170,
                              height: 86,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(221, 228, 235, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(19),

                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/cash.svg'
                                    ),
                                    SizedBox(width: 5,),
                                    Column(children:[ Text('₹${profiledata['directIncome']}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),Text('Direct Income')]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),

                            child:  Container(
                              width: 170,
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
                                    SizedBox(width: 5,),
                                    Column(children:[ Text('₹${profiledata['inDirectIncome']}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),Text('InDirect Income')]),
                                  ],
                                ),
                              ),
                            ),
                          ), Padding(
                            padding: const EdgeInsets.all(8.0),

                            child:  Container(
                              width: 170,
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
                                    SizedBox(width: 5,),
                                    Column(children:[ Text('₹${profiledata['totalLevelIncome']}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),Text('Level Income')]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ]
                      );
                    }),
              ),
              Container(
                width: 59,
                height: 59,
                // child: SvgPicture.asset('assetName'),
                decoration: BoxDecoration( color: Color.fromRGBO(221, 228, 235, 1),
                    borderRadius: BorderRadius.circular(0.5*59)),),
              SizedBox(height: 10,),
              Text(profiledata['name']),
              Text(profiledata['userStatus']),
              SizedBox(height: 20,),
Container(
  width: double.infinity,
  decoration: BoxDecoration(color: Color.fromRGBO(7, 39, 64, 1), borderRadius: BorderRadius.circular(10)),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.mail,color: Colors.white,size: 15 ,),
            SizedBox(width: 5,),
            Text('Email : ${profiledata['email']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.phone,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Phone : ${profiledata['phone']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.numbers,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('UserId : ${profiledata['ownSponserId']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.location_city,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Address : ${profiledata['address']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.calendar_month,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Date Of Birth : ${profiledata['dateOfBirth']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.wallet,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Package Amount : ${profiledata['packageAmount']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.wallet,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Wallet Amount : ${profiledata['walletAmount']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.type_specimen,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Package Type : ${profiledata['packageType']}',style: TextStyle(color: Colors.white),),

          ],),
          // SizedBox(height: 8,),
          // Row(children: [
          //   Icon(Icons.drive_file_rename_outline,color: Colors.white,size: 15),
          //   SizedBox(width: 5,),
          //   Text('Package Name : ${profiledata['']}',style: TextStyle(color: Colors.white),),
          //
          // ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.stacked_bar_chart,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Points : ${profiledata['points']}',style: TextStyle(color: Colors.white),),

          ],),
          SizedBox(height: 8,),
          Row(children: [
            Icon(Icons.leaderboard,color: Colors.white,size: 15),
            SizedBox(width: 5,),
            Text('Pool Rank : ${profiledata['pool']}',style: TextStyle(color: Colors.white),),

          ],),
        ],
      ),
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}


