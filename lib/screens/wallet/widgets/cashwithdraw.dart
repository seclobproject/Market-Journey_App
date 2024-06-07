import 'package:flutter/material.dart';
import 'package:master_journey/screens/wallet/wallet_page.dart';

import '../../../resources/color.dart';

class Cashwithdraw extends StatefulWidget {
  const Cashwithdraw({super.key});

  @override
  State<Cashwithdraw> createState() => _CashwithdrawState();
}

class _CashwithdrawState extends State<Cashwithdraw> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _tdsController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_updateAmount);
  }

  void _updateAmount() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    final tdsAmount = amount * 0.05;
    final serviceAmount = amount * 0.05;
    _tdsController.text = tdsAmount.toStringAsFixed(2);
    _serviceController.text = serviceAmount.toStringAsFixed(2);
    _totalController.text =
        (amount - tdsAmount - serviceAmount).toStringAsFixed(2);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _tdsController.dispose();
    _serviceController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdrawal', style: TextStyle(color: black, fontSize: 16)),
        centerTitle: true,
        backgroundColor: marketbg,
      ),
      backgroundColor: marketbg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Amount',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('TDS Amount',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _tdsController,
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Service Amount',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                readOnly: true,
                controller: _serviceController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Total Amount',
                      style: TextStyle(color: marketbgblue, fontSize: 14))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                readOnly: true,
                controller: _totalController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: yellow, width: 2),
                  ),
                ),
                style: TextStyle(
                    color: black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       showDialog(
                      //         context: context,
                      //         builder: (context) => AlertDialog(
                      //           content: Text(
                      //             'Are you sure you want to cancel?',
                      //             style: TextStyle(
                      //                 fontSize: 15, fontWeight: FontWeight.w500),
                      //           ),Image.asset(
                      //         'assets/logo/wallet.png',
                      //         fit: BoxFit.none,
                      //       ),
                      //           actions: [
                      //             Row(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Container(
                      //                   width: 60,
                      //                   height: 40,
                      //                   decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(6),
                      //                       color: marketbgblue),
                      //                   alignment: Alignment.center,
                      //                   child: TextButton(
                      //                     onPressed: () {
                      //                       Navigator.of(context)
                      //                           .pop(); // Close the dialog
                      //                     },
                      //                     child: Text(
                      //                       'No',
                      //                       style: TextStyle(color: marketbg),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Container(
                      //                   width: 60,
                      //                   height: 40,
                      //                   decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(6),
                      //                       color: appBlueColor),
                      //                   child: TextButton(
                      //                     onPressed: () {
                      //                       Navigator.of(context).push(
                      //                           MaterialPageRoute(
                      //                               builder: (context) =>
                      //                                   wallet())); // Go back to wallet page
                      //                     },
                      //                     child: Text(
                      //                       'Yes',
                      //                       style: TextStyle(color: marketbg),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //     child: Container(
                      //       height: 40,
                      //       width: 100,
                      //       decoration: BoxDecoration(
                      //           border: Border.all(color: yellow, width: 3),
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //           child: Text(
                      //         'Cancel',
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.w500),
                      //       )),
                      //     ),
                      //   ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Set the size of the column to min
                                children: [
                                  Text(
                                    'Are you sure you want to cancel?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                      height:
                                          20), // Add some space between text and image
                                  Image.asset(
                                    'assets/logo/exclamation-mark.png',
                                    width: 40,
                                  ),
                                ],
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: marketbgblue,
                                      ),
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(color: marketbg),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: appBlueColor,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => wallet(),
                                            ),
                                          ); // Go back to wallet page
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(color: marketbg),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: yellow, width: 3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
