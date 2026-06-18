import 'package:flutter/material.dart';

class Redirecter extends StatelessWidget {
  final String imagepath;
  final WidgetBuilder screen;

  const Redirecter({
    Key? key,
    required this.imagepath,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: screen),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagepath,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}