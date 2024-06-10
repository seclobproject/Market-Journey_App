import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class levelfourreport extends StatefulWidget {
  const levelfourreport({super.key});

  @override
  State<levelfourreport> createState() => _levelfourreportState();
}

class _levelfourreportState extends State<levelfourreport> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text("Amount", style: TextStyle(color: black, fontSize: 12)),
              SizedBox(width: 50,),
              Text("TDS Amount", style: TextStyle(color: black, fontSize: 12)),
              SizedBox(width: 35,),
              Text("Amount", style: TextStyle(color: black, fontSize: 12)),
              Expanded(child: SizedBox()),
              Text("Status", style: TextStyle(color: black, fontSize: 12)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: yellow,
            thickness: 1,
          ),
        ),
      //   Expanded(
      //     child: ListView.builder(
      //       itemCount: 20,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20),
      //           child: Column(
      //             children: [
      //               SizedBox(height: 5),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   // Text("${index + 1}", style: TextStyle(color: btnttext, fontSize: 10)),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         '₹1000',
      //                         style: TextStyle(
      //                             color: bluem,
      //                             fontSize: 10,
      //                             fontWeight: FontWeight.w800),
      //                       ),
      //                     ],
      //                   ),

      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         '₹100',
      //                         style: TextStyle(
      //                             color: bluem,
      //                             fontSize: 10,
      //                             fontWeight: FontWeight.w800),
      //                       ),
      //                     ],
      //                   ),

      //                   Text('₹900',
      //                       style: TextStyle(
      //                           color: bluem,
      //                           fontSize: 10,
      //                           fontWeight: FontWeight.w800)),
      //                   Container(
      //                     width: 45,
      //                     height: 16,
      //                     decoration: BoxDecoration(
      //                         color: greenbg,
      //                         borderRadius:
      //                         BorderRadius.all(Radius.circular(5))),
      //                     child: Center(
      //                       child: Text(
      //                         'Accepted',
      //                         style: TextStyle(color: marketbg, fontSize: 8),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(height: 20),
      //             ],
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      ],
    );
  }
}
