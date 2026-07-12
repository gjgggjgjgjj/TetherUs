import 'package:flutter/material.dart';
import '../widgets/pet_widgets.dart';

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
        child: Stack(
          children: [
            Center(),
            Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      kitchenDir,
                      outdoorDir,
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}