import 'package:flutter/material.dart';


class Pet {
  final String name;
  final String imagePath;

  Pet({
    required this.name, 
    required this.imagePath});

  int happiness = 50;
  int bathroom = 100;   //once it reaches a certain point buddy needs to go
  int hunger = 100;  
  int energy = 100;
  int cleanliness = 100;

  //get the stats -------------------------------------
  String getHappiness() {
    return 'Happiness: $happiness';
  }

  String getBathroom() {
    return 'Bathroom: $bathroom';
  }

  String getHunger() {
    return 'Hunger: $hunger';
  }

  String getEnergy() {
    return 'Energy: $energy';
  }
  String getCleanliness() {
    return 'Cleanliness: $cleanliness';
  }
  // -------------------------------------------------------

  //functinons to manipulate the pet's stats ---------
  void feed(int foodVal) {
    hunger += foodVal;
    if (hunger > 100) {
      hunger = 100;
    }
  }

  void play(int playVal) {
    energy -= playVal;
    if (energy < 0) {
      energy = 0;
    }
    happiness += 20;
    if (happiness > 100) {
      happiness = 100;
    }
  }

  void clean() {
    cleanliness = 100;
  }

  void goToBathroom() {
    bathroom = 100;

    cleanliness -= 10;
    if (cleanliness < 0) {
      cleanliness = 0;
    }

    play(0);
  }
  // -------------------------------------------------------

  // Time-based pet simulation ---------------------------------
  //later we could update with the users time
  void passTime({int minutes = 1}) {
    hunger = _clamp(hunger - minutes * 2);
    energy = _clamp(energy - minutes);
    bathroom = _clamp(bathroom - minutes * 3);
    cleanliness = _clamp(cleanliness - minutes);
    happiness = _clamp(happiness - minutes);
  }

  //bool functions to check the pet's needs
  bool needsBathroom() => bathroom < 30;
  bool isHungry() => hunger < 40;
  bool isSleepy() => energy < 35;
  bool needsCleaning() => cleanliness < 40;

  int _clamp(int value) {
    if (value < 0) return 0;
    if (value > 100) return 100;
    return value;
  }
  // -------------------------------------------------------
}
//============================================================================
//============================================================================

//here is the widget class-----------------------------------------------
class PetWidget extends StatefulWidget {
  final String name; 
  final String imagepath;

  const PetWidget({
    super.key,
    required this.name, 
    required this.imagepath
  });

  @override
  State<PetWidget> createState() => _PetState();
}

class _PetState extends State<PetWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTapDown: (_) {
            setState(() {
              isTapped = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              isTapped = false;
            });
          },
          onTapCancel: () {
            setState(() {
              isTapped = false;
            });
          },

          child: Image.asset(widget.imagepath),
        ),
      

        if (isTapped) 
          Positioned(
            top: 0,
            child: Row(
              children: [
                Text("😍", style: TextStyle(fontSize: 32)),
                SizedBox(width: 10),
                Text("😂", style: TextStyle(fontSize: 32)),
                SizedBox(width: 10),
                Text("😮", style: TextStyle(fontSize: 32)),
                SizedBox(width: 10),
                Text("😡", style: TextStyle(fontSize: 32)),
              ],
            )
          )
        
      ],
    );
    
  }
}


