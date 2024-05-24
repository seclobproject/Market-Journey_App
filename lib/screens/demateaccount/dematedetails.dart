// import 'package:flutter/material.dart';
// import 'package:master_journey/resources/color.dart';

// class Dematedetails extends StatefulWidget {
//   const Dematedetails({super.key});

//   @override
//   State<Dematedetails> createState() => _DematedetailsState();
// }

// class _DematedetailsState extends State<Dematedetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Demat details',
//             style: TextStyle(color: black, fontSize: 16),
//           ),
//           centerTitle: true,
//           backgroundColor: marketbg,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: Container(
//                         height: 107,
//                         width: 400,
//                         decoration: BoxDecoration(
//                             color: bluem,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Name",
//                                     style: TextStyle(
//                                         fontSize: 12, color: marketbg),
//                                   ),
//                                   SizedBox(
//                                     width: 40,
//                                   ),
//                                   Text(":",
//                                       style: TextStyle(
//                                           fontSize: 12, color: marketbg)),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Text(
//                                     "Fathima ",
//                                     style: TextStyle(
//                                         fontSize: 12, color: marketbg),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Franchise",
//                                     style: TextStyle(
//                                         fontSize: 12, color: marketbg),
//                                   ),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Text(":",
//                                       style: TextStyle(
//                                           fontSize: 12, color: marketbg)),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Text(
//                                     "Mobile Franchise  ",
//                                     style: TextStyle(
//                                         fontSize: 12, color: marketbg),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Package",
//                                     style: TextStyle(
//                                         fontSize: 12, color: marketbg),
//                                   ),
//                                   SizedBox(
//                                     width: 24,
//                                   ),
//                                   Text(":",
//                                       style: TextStyle(
//                                           fontSize: 12, color: marketbg)),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Text(
//                                     "₹1000 ",
//                                     style: TextStyle(
//                                         fontSize: 12, color: marketbg),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },),
//             ],
//           ),
//         ),);
//   }
// }

import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';

class Dematedetails extends StatefulWidget {
  const Dematedetails({super.key});

  @override
  State<Dematedetails> createState() => _DematedetailsState();
}

class _DematedetailsState extends State<Dematedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demat details',
          style: TextStyle(color: black, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              width: 400,
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "District",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 40),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "",
                          style: TextStyle(fontSize: 12, color: bluem),
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
                          "Name",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 16),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "",
                          style: TextStyle(fontSize: 12, color: bluem),
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
                          "Username",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 24),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "",
                          style: TextStyle(fontSize: 12, color: bluem),
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
                          "Mobile Number",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 16),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "",
                          style: TextStyle(fontSize: 12, color: bluem),
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
                          "Email",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 16),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "",
                          style: TextStyle(fontSize: 12, color: bluem),
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
                          "Address",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 16),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 12, color: bluem),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "",
                          style: TextStyle(fontSize: 12, color: bluem),
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
