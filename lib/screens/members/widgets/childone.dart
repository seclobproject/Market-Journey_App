import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/member_service.dart';
import '../../../support/logger.dart';

class Childone extends StatefulWidget {
  final String searchQuery;

  const Childone({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<Childone> createState() => _ChildoneState();
}

class _ChildoneState extends State<Childone> {
  var userid;
  var child1;
  List filteredChild1 = [];
  bool _isLoading = true;

  Future _childOne() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');

    var response = await MemberService.leveloneview();
    log.i('Profile data show.... $response');
    setState(() {
      child1 = response;
      _filterChild1();
      _isLoading = false;
    });
  }

  void _filterChild1() {
    if (widget.searchQuery.isNotEmpty && child1 != null) {
      filteredChild1 = child1
          .where((item) => item['name']
              .toLowerCase()
              .contains(widget.searchQuery.toLowerCase()))
          .toList();
    } else {
      filteredChild1 = child1 ?? [];
    }
    log.i('Filtered data: $filteredChild1');
  }

  Future _initLoad() async {
    await Future.wait(
      [
        _childOne(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _initLoad();
  }

  @override
  void didUpdateWidget(Childone oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      setState(() {
        _filterChild1();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filteredChild1.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    height: 107,
                    width: 400,
                    decoration: BoxDecoration(
                        color: bluem, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(fontSize: 12, color: marketbg),
                              ),
                              SizedBox(width: 40),
                              Text(":",
                                  style:
                                      TextStyle(fontSize: 12, color: marketbg)),
                              SizedBox(width: 20),
                              Text(
                                filteredChild1[index]['name'],
                                style: TextStyle(fontSize: 12, color: marketbg),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Franchise",
                                style: TextStyle(fontSize: 12, color: marketbg),
                              ),
                              SizedBox(width: 16),
                              Text(":",
                                  style:
                                      TextStyle(fontSize: 12, color: marketbg)),
                              SizedBox(width: 20),
                              Text(
                                filteredChild1[index]['franchise'],
                                style: TextStyle(fontSize: 12, color: marketbg),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Package",
                                style: TextStyle(fontSize: 12, color: marketbg),
                              ),
                              SizedBox(width: 24),
                              Text(":",
                                  style:
                                      TextStyle(fontSize: 12, color: marketbg)),
                              SizedBox(width: 20),
                              Text(
                                filteredChild1[index]['tempPackageAmount']
                                    .toString(),
                                style: TextStyle(fontSize: 12, color: marketbg),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
