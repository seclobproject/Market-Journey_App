import 'package:flutter/material.dart';

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
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: yellow, width: 3),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
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
