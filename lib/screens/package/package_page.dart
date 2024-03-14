import 'package:flutter/material.dart';
import '../../resources/color.dart';


class package extends StatefulWidget {
  const package({super.key});

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: marketbg,
      appBar: AppBar(
        backgroundColor: marketbg,
        title: Text("Package",style: TextStyle(color: black, fontSize: 18),),
      ),
      body: Column(
       children: [

         SizedBox(height: 20,),


         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Container(
             height: 76,
             width: 400,
             decoration: BoxDecoration(
               color: bluem,
               borderRadius: BorderRadius.circular(10)
             ),
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Franchise',style: TextStyle(color: marketbg),),
                       Text('Package',style: TextStyle(color: marketbg)),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Mobile Franchise ',style: TextStyle(color: marketbg,fontSize: 10),),
                       Text('₹1000',style: TextStyle(color: marketbg)),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         )

       ],
      ),

    );
  }
}
