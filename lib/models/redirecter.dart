import 'package:flutter/material.dart';

class Redirecter extends StatelessWidget {
  final String imagepath;
  final WidgetBuilder screen;
  final double width;
  final double height;
  final double bottomPadding;

  const Redirecter({
    super.key,
    required this.imagepath,
    required this.screen,
    this.width = 150,
    this.height = 150,
    this.bottomPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: screen),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagepath,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}