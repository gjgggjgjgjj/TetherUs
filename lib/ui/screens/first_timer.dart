import 'package:flutter/material.dart';
import '../widgets/infowidget.dart';


class AboutTether extends StatelessWidget{
  const AboutTether({super.key});

  @override 
  Widget build(BuildContext context) {
    //making the snapping behavior when swiping
    final controller = PageController(
      viewportFraction: 1.0,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        controller: controller,
        /*physics: const BouncingScrollPhysics(
          parent:  PageScrollPhysics(),
          
        ),*/ //makes it snap
          children: [
            //gonna have our premade widget here
            AboutClass(thetext: "first widget"),
            AboutClass(thetext: "second widget"),
            AboutClass(thetext: "third widget"),
            AboutClass(thetext: "fourth widget"),
            AboutClass(thetext: "fifth widget"),
          ],
      ),
    );
  }
}
