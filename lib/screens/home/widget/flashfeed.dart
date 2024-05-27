import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class Flashfeed extends StatefulWidget {
  const Flashfeed({super.key});

  @override
  State<Flashfeed> createState() => _FlashfeedState();
}

class _FlashfeedState extends State<Flashfeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flash Feed',
          style: TextStyle(color: black, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: marketbg,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  // This is the container for the image
                                  height: 222,
                                  width: 341,
                                  decoration: BoxDecoration(
                                    color: bottomtabbg,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_the_Importance_of_Technology.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                // This is the container for aligning at the top right corner
                                // Row(crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Align(
                                //       alignment: Alignment.topLeft,
                                //       child: Container(
                                //         height: 33,
                                //         width: 53,
                                //         decoration: BoxDecoration(
                                //           color: yellow,
                                //           borderRadius: BorderRadius.circular(5),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "New",
                                //           style: TextStyle(fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     Align(
                                //       alignment: Alignment.bottomCenter,
                                //       child: Container(
                                //         height: 33,
                                //         decoration: BoxDecoration(
                                //           color: yellow,
                                //           borderRadius:
                                //               BorderRadius.circular(5),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "Journey of inspiration and discovery",
                                //           style: TextStyle(fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    height: 33,
                                    width: 53,
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "New",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                                // This is the container for aligning at the bottom center
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: whitegray,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Journey of inspiration and discovery",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
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
