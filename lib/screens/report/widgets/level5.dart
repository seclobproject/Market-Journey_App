import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class levelfivereport extends StatefulWidget {
  const levelfivereport({super.key});

  @override
  State<levelfivereport> createState() => _levelfivereportState();
}

class _levelfivereportState extends State<levelfivereport> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text("Amount", style: TextStyle(color: black, fontSize: 12)),
              SizedBox(
                width: 70,
              ),
              Text("TDS Amount", style: TextStyle(color: black, fontSize: 12)),
              Expanded(child: SizedBox()),
              Text("Amount", style: TextStyle(color: black, fontSize: 12)),

              // Text("Status", style: TextStyle(color: black, fontSize: 12)),
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
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 20,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Column(
        //           children: [
        //             SizedBox(height: 5),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text("${index + 1}",
        //                         style: TextStyle(color: bluem, fontSize: 12)),
        //                   ],
        //                 ),
        //                 Text('Fathima',
        //                     style: TextStyle(
        //                         color: bluem,
        //                         fontSize: 12,
        //                         fontWeight: FontWeight.w600)),
        //                 Center(
        //                   child: Text(
        //                     'Mobile franchise',
        //                     style: TextStyle(color: bluem, fontSize: 12),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 5),
        //             Divider(
        //               color: black,
        //               thickness: 0.2,
        //             )
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
