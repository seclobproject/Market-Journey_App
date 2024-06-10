import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class LevelFiveReport extends StatefulWidget {
  const LevelFiveReport({super.key});

  @override
  State<LevelFiveReport> createState() => _LevelFiveReportState();
}

class _LevelFiveReportState extends State<LevelFiveReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              // Enable horizontal scrolling
              child: Center(
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
                        label: Text('BonusAmount',
                            style: TextStyle(
                                color: black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500))),
                  ],
                  rows: List<DataRow>.generate(
                    20,
                        (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text('${index + 1}',
                            style: TextStyle(color: bluem, fontSize: 12))),
                        DataCell(Text('Fathima',
                            style: TextStyle(
                                color: bluem,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))),
                        DataCell(Text('1000',
                            style: TextStyle(
                                color: bluem,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))),
                      ],
                    ),
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