import 'package:flutter/material.dart';
import 'package:master_journey/services/package_service.dart';
import 'package:master_journey/support/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';

class package extends StatefulWidget {
  const package({super.key});

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {

 var userid;
  var packagedata;  
  bool _isLoading = true;




  
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
      backgroundColor: marketbg, 
      appBar: AppBar(
        backgroundColor: marketbg,
        title: Center(
          child: Text(
            "Package",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
      body:_isLoading
          ? Center(child: CircularProgressIndicator()):
       Padding(
        padding: const EdgeInsets.only(left:20 ),
        child: ListView(
          
          children: [



            
            Padding(
              padding: const EdgeInsets.only(top: 24,  bottom: 20),
              child: Text(
                "Franchise",
                style: TextStyle(
                  color: Color(0xff163A56),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Container(
                    height: 76,
                    width: 312,
                    decoration: BoxDecoration(
                      color: bluem,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Franchise Package',
                                style: TextStyle(
                                  color: marketbg,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Package Amount',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: marketbg),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mobile Franchise',
                                style: TextStyle(
                                  color: yellow,
                                  fontSize: 12,
                                ),
                              ),
                              Text(packagedata['packageData'][index]['packageAmount'], style: TextStyle(color: yellow)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            Text('Course',
            style: TextStyle(
                  color: Color(0xff163A56),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
            Expanded(
              child: Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: Container(
                      height: 76,
                      width: 312,
                      decoration: BoxDecoration(
                        color: bluem,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Franchise Package',
                                  style: TextStyle(
                                    color: marketbg,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Package Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: marketbg),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mobile Franchise',
                                  style: TextStyle(
                                    color: yellow,
                                    fontSize: 12
                                  ),
                                ),
                                Text(packagedata['packageData'][index]['packageAmount'],style: TextStyle(color: yellow)) ,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
             Text('Signals',
            style: TextStyle(
                  color: Color(0xff163A56),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
            Column(
              children: List.generate(6, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Container(
                    height: 76,
                    width: 312,
                    decoration: BoxDecoration(
                      color: bluem,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Franchise Package',
                                style: TextStyle(
                                  color: marketbg,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Package Amount',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: marketbg),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mobile Franchise',
                                style: TextStyle(
                                  color: yellow,
                                  fontSize: 12,
                                ),
                              ),
                              Text(packagedata['packageData'][index]['packageAmount'],style: TextStyle(color: yellow)),
                            ],
                          ),
                        ],
                      ),
                    ),
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
