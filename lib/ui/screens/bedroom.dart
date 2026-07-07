import 'package:flutter/material.dart';

class Bedroom extends StatelessWidget{
  const Bedroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bedBackdrop.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}