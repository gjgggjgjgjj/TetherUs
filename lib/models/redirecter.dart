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
    this.width = 100,
    this.height = 100,
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

//will pop up a widget into the center
class WidgetRedirecter extends StatelessWidget {
  final String imagepath;
  final WidgetBuilder popup;
  final double width;
  final double height;
  final double bottomPadding;

  const WidgetRedirecter({
    super.key,
    required this.imagepath,
    required this.popup,
    this.width = 100,
    this.height = 100,
    this.bottomPadding = 20,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (ctx) {
            final screenH = MediaQuery.of(ctx).size.height;
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                height: screenH * 0.5, // covers about half the screen
                child: popup(ctx),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(imagepath, width: width, height: height, fit: BoxFit.cover),
        ),
      ),
    );
  }
}