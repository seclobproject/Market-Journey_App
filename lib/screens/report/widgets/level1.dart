import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../resources/color.dart';
import '../../../services/report_service.dart';
import '../../../support/logger.dart';

class Level0neReport extends StatefulWidget {
  const Level0neReport({super.key});

  @override
  State<Level0neReport> createState() => _Level0neReportState();
}

class _Level0neReportState extends State<Level0neReport> {
  List<dynamic> directIncome = [];
  bool _isLoading = true;

  Future<void> _fetchDirectIncome() async {
    try {
      var response = await IncomeService.report1();
      log.i('API Response: $response');

      setState(() {
        directIncome = response['directIncome'] ?? [];
        log.i('directIncome: $directIncome'); // Log the inDirectIncome list
        _isLoading = false;
      });
    } catch (error) {
      log.e('Failed to fetch data: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    } catch (e) {
      log.e('Date format error: $e');
      return date;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDirectIncome();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
          valueColor: AlwaysStoppedAnimation(yellow),
        ),
      );
    }

    if (directIncome.isEmpty) {
      return Center(child: Text('No data available'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 5),
          Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(color: whitegray),
            child: Center(
              child: Table(
                children: const [
                  TableRow(
                    children: [
                      Center(
                        child: Text("Sino",
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Text("Date",
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Text("Amount From",
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Text("Franchise",
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Text("Percentage",
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                      Center(
                        child: Text("Amount",
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
            child: Table(
              children: directIncome.map<TableRow>((income) {
                return TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                          '${directIncome.indexOf(income) + 1}',
                          style: TextStyle(
                              color: bluem,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        _formatDate(income['createdAt'] ?? "No Date"),
                        style: TextStyle(
                            color: bluem,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Center(
                      child: Text(
                        income['name']?.toString() ?? "No Data",
                        style: TextStyle(
                            color: bluem,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Center(
                      child: Text(
                        income['franchise']?.toString() ?? "No Data",
                        style: TextStyle(
                            color: bluem,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Center(
                      child: Text(
                        income['percentageCredited']?.toString() ?? "No Data",
                        style: TextStyle(
                            color: bluem,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Center(
                      child: Text(
                        income['amountCredited']?.toString() ?? "No Data",
                        style: TextStyle(
                            color: bluem,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}