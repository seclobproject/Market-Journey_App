import 'package:flutter/material.dart';

import '../../../resources/color.dart';

class leveltwo extends StatefulWidget {
  const leveltwo({super.key});

  @override
  State<leveltwo> createState() => _leveltwoState();
}

class _leveltwoState extends State<leveltwo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 107,
              width: 400,
              decoration: BoxDecoration(
                  color: bluem,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text("Name",style: TextStyle(fontSize: 12,color: marketbg),),
                        SizedBox(width: 60,),
                        Text(":",style: TextStyle(fontSize: 12,color: marketbg)),
                        SizedBox(width: 60,),
                        Text("Fathima ",style: TextStyle(fontSize: 12,color: marketbg),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text("Franchise",style: TextStyle(fontSize: 12,color: marketbg),),
                        SizedBox(width: 36,),
                        Text(":",style: TextStyle(fontSize: 12,color: marketbg)),
                        SizedBox(width: 60,),
                        Text("Mobile Franchise  ",style: TextStyle(fontSize: 12,color: marketbg),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text("Package",style: TextStyle(fontSize: 12,color: marketbg),),
                        SizedBox(width: 44,),
                        Text(":",style: TextStyle(fontSize: 12,color: marketbg)),
                        SizedBox(width: 60,),
                        Text("₹1000 ",style: TextStyle(fontSize: 12,color: marketbg),),
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
