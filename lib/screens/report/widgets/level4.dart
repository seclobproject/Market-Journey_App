import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class LevelFourReport extends StatefulWidget {
  const LevelFourReport({super.key});

  @override
  State<LevelFourReport> createState() => _LevelFourReportState();
}

class _LevelFourReportState extends State<LevelFourReport> {
  @override
  Widget build(BuildContext context) {
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
                      DataCell(Text('Fathima',
                          style: TextStyle(
                              color: bluem,
                              fontSize: 12,
                              fontWeight: FontWeight.w600))),
                      DataCell(Text('Fathima',
                          style: TextStyle(
                              color: bluem,
                              fontSize: 12,
                              fontWeight: FontWeight.w600))),
                      DataCell(Text('Mobile franchise',
                          style: TextStyle(color: bluem, fontSize: 12))),
                      DataCell(Text('1000',
                          style: TextStyle(color: bluem, fontSize: 12))),
                    ],
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