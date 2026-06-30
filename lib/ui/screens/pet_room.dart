import 'package:flutter/material.dart';
import '../widgets/pet_widgets.dart';

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
            image: AssetImage('assets/images/Main room.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: miloWidget,
              ),
            ),
            Row(
              children: [
                kitchenDir,
                outdoorDir,
              ],
            ),
          ],
        ),
      ),
    );
  }
}