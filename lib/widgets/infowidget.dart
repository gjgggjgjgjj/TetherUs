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
    color: Colors.blue,
    alignment: Alignment.center,
    child: Text(thetext),
   ); 
  }
}