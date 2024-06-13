import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../resources/color.dart';
import '../../../services/report_service.dart';
import '../../../support/logger.dart';

class LevelFiveReport extends StatefulWidget {
  const LevelFiveReport({super.key});

  @override
  State<LevelFiveReport> createState() => _LevelFiveReportState();
}

class _LevelFiveReportState extends State<LevelFiveReport> {
  List<dynamic> Bonus = [];
  bool _isLoading = true;

  Future<void> _fetchBonus() async {
    try {
      var response = await IncomeService.report5();
      log.i('API Response: $response');

      setState(() {
        Bonus = response['Bonus'] ?? [];
        log.i('Bonus: $Bonus');  // Log the Bonus list
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
    _fetchBonus();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(
        strokeWidth: 6.0,
        valueColor: AlwaysStoppedAnimation(yellow),
      ),);
    }

    if (Bonus.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width - 16, // Subtracting padding
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                          label: Text('Sino',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                              )
                          )
                      ),
                      DataColumn(
                          label: Text('Date',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                              )
                          )
                      ),
                      DataColumn(
                          label: Text('BonusAmount',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                              )
                          )
                      ),
                    ],
                    rows: Bonus.asMap().entries.map<DataRow>((entry) {
                      int index = entry.key;
                      var income = entry.value;
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(
                              '${index + 1}',
                              style: TextStyle(color: bluem, fontSize: 12)
                          )),
                          DataCell(Text(
                              _formatDate(income['date'] ?? "No Date"),
                              style: TextStyle(
                                  color: bluem,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              )
                          )),
                          DataCell(Text(
                              income['Bonus']?.toString() ?? "No Data",
                              style: TextStyle(
                                  color: bluem,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              )
                          )),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}