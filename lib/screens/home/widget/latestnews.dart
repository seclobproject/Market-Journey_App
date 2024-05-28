import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class Latestnews extends StatefulWidget {
  const Latestnews({super.key});

  @override
  State<Latestnews> createState() => _LatestnewsState();
}

class _LatestnewsState extends State<Latestnews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest News',
          style: TextStyle(color: black, fontSize: 16),
        ),
        centerTitle: true,
      ),
      backgroundColor: marketbg,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: bluem,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mastering the Art of Trading",
                              style: TextStyle(
                                color: marketbg,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Monday Aug 01,2022",
                              style: TextStyle(
                                color: whitegray,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Text(
                                "Mastering the Art of Trading refers to achieving a high level of proficiency and expertise in the practice of buying and selling financial instruments such as stocks, bonds",
                                style: TextStyle(
                                  color: marketbg,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
