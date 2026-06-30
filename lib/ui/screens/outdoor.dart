import 'package:flutter/material.dart';
import '../widgets/pet_widgets.dart';

class Outdoor extends StatelessWidget{
  const Outdoor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/outdoor_backdrop.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: miloWidget,
        ),
      ),
    );
  }
}