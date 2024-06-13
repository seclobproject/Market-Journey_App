import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../resources/color.dart';
import '../../../services/report_service.dart';
import '../../../support/logger.dart';

class LevelFourReport extends StatefulWidget {
  const LevelFourReport({super.key});

  @override
  State<LevelFourReport> createState() => _LevelFourReportState();
}

class _LevelFourReportState extends State<LevelFourReport> {

  @override
  List<dynamic> Autopool = [];
  bool _isLoading = true;

  Future<void> _fetchAutopool() async {
    try {
      var response = await IncomeService.report3();
      log.i('API Response: $response');

      setState(() {
        Autopool = response['Autopool'] ?? [];
        log.i('Autopool: $Autopool');  // Log the directIncome list
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
    _fetchAutopool();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(
        strokeWidth: 6.0,
        valueColor: AlwaysStoppedAnimation(yellow),
      ),);
    }

    if (Autopool.isEmpty) {
      return Center(child: Text('No data available'));
    }




    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [
            SizedBox(height: 5),
            Expanded(
              child: SingleChildScrollView(



                scrollDirection: Axis.horizontal, // Enable horizontal scrolling

                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Sino',
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),


                    DataColumn(
                        label: Text('Designation',style: TextStyle(
                            color: black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),

                    DataColumn(
                        label: Text('AmountFrom',
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),
                    DataColumn(
                        label: Text('Franchise',

                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),
                    DataColumn(
                        label: Text('Percentage',
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),
                    DataColumn(
                        label: Text('AmountCredited',
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),
                  ],

                  rows: Autopool.map<DataRow>((income) {
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text('${Autopool.indexOf(income) + 1}',
                            style: TextStyle(color: bluem, fontSize: 12))),
                        DataCell(Text(_formatDate(income['date'] ?? "No Date"))),




                        DataCell(Text(income['Designation']?.toString() ?? "No Data")),


                        DataCell(Text(income['percentageCredited']?.toString() ?? "No Data",
                            style: TextStyle(color: bluem, fontSize: 12))),
                        DataCell(Text(income['amountCredited']?.toString() ?? "No Data",
                            style: TextStyle(color: bluem, fontSize: 12))),
                      ],
                    );
                  }).toList(),



                ),
              ),

            ),
          ]),
    );

  }
}