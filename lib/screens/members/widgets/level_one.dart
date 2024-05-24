import 'package:flutter/material.dart';
import 'package:master_journey/resources/color.dart';

class levelone extends StatefulWidget {
  const levelone({super.key});

  @override
  State<levelone> createState() => _leveloneState();
}

class _leveloneState extends State<levelone> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 107,
              width: 400,
              decoration: BoxDecoration(
                  color: bluem, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(fontSize: 12, color: marketbg),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(":",
                            style: TextStyle(fontSize: 12, color: marketbg)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Fathima ",
                          style: TextStyle(fontSize: 12, color: marketbg),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Franchise",
                          style: TextStyle(fontSize: 12, color: marketbg),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(":",
                            style: TextStyle(fontSize: 12, color: marketbg)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Mobile Franchise  ",
                          style: TextStyle(fontSize: 12, color: marketbg),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Package",
                          style: TextStyle(fontSize: 12, color: marketbg),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(":",
                            style: TextStyle(fontSize: 12, color: marketbg)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "₹1000 ",
                          style: TextStyle(fontSize: 12, color: marketbg),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
