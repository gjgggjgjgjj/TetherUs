import 'package:flutter/material.dart';

class Redirecter extends StatelessWidget {
  final String imagepath;
  final String screenName;

  const Redirecter({
    Key? key,
    required this.imagepath,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, screenName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagepath,
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}