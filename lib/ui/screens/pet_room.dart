import 'package:flutter/material.dart';

class PetRoom extends StatelessWidget{
  const PetRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mainRoom.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Image(
            image: AssetImage('../../assets/images/MainDog-Picsart-BackgroundRemover.png'),
          ),
        ),
      ),
    );
  }
}