import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_journey/screens/wallet/widgets/recent_transaction.dart';

import '../../../resources/color.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Subscription', style: TextStyle(color: black, fontSize: 16)),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
//       backgroundColor: marketbg,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Container(
//               width:
//                   double.infinity, // Use double.infinity to match parent width
//               decoration: BoxDecoration(
//                 color: bluem,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children: [
//                         Text(
//                           "10",
//                           style: TextStyle(
//                               fontSize: 40,
//                               fontWeight: FontWeight.w700,
//                               color: marketbg),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Days left",
//                           style: TextStyle(fontSize: 15, color: marketbg),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children:[
//                         Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "Your monthly subscription plan has\n10 days to renew Subscription is 0\nPlease upload the screenshot",
//                               style: TextStyle(color: marketbg, fontSize: 12),
//                             )),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         SvgPicture.asset(
//                           'assets/svg/bgsvghome.svg',
//                           height: 70,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         height: 30,
//                         width: 160,
//                         decoration: BoxDecoration(
//                             color: yellow,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                             child: Text(
//                           'Subscription Package',
//                           style: TextStyle(fontSize: 10),
//                         )),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "Transaction History",
//                       style: TextStyle(
//                         color: Color(0xff163A56),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Expanded(child: recenttransation())
//         ],
//       ),
//     );
//   }
// }

      backgroundColor: marketbg,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 190,
              width:
                  double.infinity, // Use double.infinity to match parent width
              decoration: BoxDecoration(
                color: bluem,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: marketbg,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Days left",
                              style: TextStyle(
                                fontSize: 15,
                                color: marketbg,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Your monthly subscription plan has\n10 days to renew Subscription is 0\nPlease upload the screenshot",
                                style: TextStyle(
                                  color: marketbg,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 30,
                          width: 160,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Subscription Package',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/svg/bgsvghome.svg',
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Transaction History",
                style: TextStyle(
                  color: Color(0xff163A56),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: recenttransation())
        ],
      ),
    );
  }
}
