import 'package:flutter/material.dart';


class AboutClass extends StatelessWidget{
  //parameters go here
  final String thetext;

  const AboutClass({
    super.key,
    required this.thetext,
    });

  @override
  Widget build(BuildContext context) {
   final screenwidth = MediaQuery.of(context).size.width;
   final screenheight = MediaQuery.of(context).size.height;

   return Container(
    width: screenwidth,
    height: screenheight,
    color: const Color.fromARGB(255, 250, 250, 250),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              thetext,
              style: TextStyle(
                color: Colors.black),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "wow new line haha",
              style: TextStyle(
                color: Colors.black),
              ),
          ],
        ),
      ]
    )
   ); 
  }
}