import 'package:flutter/material.dart';


class AboutClass extends StatelessWidget{
  //parameters go here
  final String thetext;
  final String imagepath;

  const AboutClass({
    super.key,
    required this.thetext,
    required this.imagepath, 
    });

  @override
  Widget build(BuildContext context) {
   final screenwidth = MediaQuery.of(context).size.width;
   final screenheight = MediaQuery.of(context).size.height;

   return Container(
    width: screenwidth,
    height: screenheight,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagepath),
        fit: BoxFit.cover,
      ),
    ),
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