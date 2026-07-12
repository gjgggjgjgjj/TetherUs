import 'package:flutter/material.dart';


class Pet {
  final String name;
  final String imagePath;

  Pet({
    required this.name, 
    required this.imagePath});

  int happiness = 50;
  int bathroom = 60;   //once it reaches a certain point buddy needs to go
  int hunger = 25;  
  int energy = 100;
  int cleanliness = 100;

  //get the stats -------------------------------------
  int getHappiness() {
    return happiness;
  }

  int getBathroom() {
    return bathroom;
  }

  int getHunger() {
    return hunger;
  }

  int getEnergy() {
    return energy;
  }
  int getCleanliness() {
    return cleanliness;
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
  final Pet pet;

  const PetWidget({
    super.key,
    required this.name, 
    required this.imagepath,
    required this.pet
  });

  @override
  State<PetWidget> createState() => _PetState();
}

class _PetState extends State<PetWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10000), //full spin
      vsync: this,
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startSpin(){
    _controller.repeat();
  }

  void _stopSpin(){
    _controller.stop();
    _controller.value = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTapDown: (_) {
            setState(() {
              isTapped = true;
              _startSpin();
            });
          },
          onTapUp: (_) {
            setState(() {
              isTapped = false;
              _stopSpin();
            });
          },
          onTapCancel: () {
            setState(() {
              isTapped = false;
              _stopSpin();
            });
          },

          child: RotationTransition(
            turns: _controller,
            child: Image.asset(widget.imagepath),
          )
        ),
      

        if (isTapped) 
          Positioned(
            top: 0,
            child: Column(
              children: [
                Text(
                  "STATS",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
                Row(
                  children: [           //each stat will call verticalStatBar
                    //first stat
                    VerticalStatBar(
                      label: '😊',
                      getValue: widget.pet.getHappiness,
                    ),
                    VerticalStatBar(
                      label: '🍕',
                      getValue: widget.pet.getHunger,
                    ),
                    VerticalStatBar(
                      label: "⚡",
                      getValue: widget.pet.getEnergy
                    ),
                    VerticalStatBar(
                      label: '🚿', 
                      getValue: widget.pet.getCleanliness
                    ),
                  ],
                ),
              ],
            )
          )
        
      ],
    );
    
  }
}

//================================================================================
// reusable vertical stat bar that reads directly from a Pet getter
//this will directly be placed into the pet widget class above
class VerticalStatBar extends StatelessWidget {
  final String label;
  final int Function() getValue;
  final int maxValue;
  final Color fillColor;
  final Color backgroundColor;
  final double width;
  final double height;

  const VerticalStatBar({
    super.key,
    required this.label,
    required this.getValue,
    this.maxValue = 100,
    this.fillColor = const Color(0xFF84C857),
    this.backgroundColor = const Color(0xFFEAEAEA),
    this.width = 28,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    final value = getValue().clamp(0, maxValue);
    final normalizedValue = value / maxValue;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: normalizedValue.toDouble()),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              builder: (context, animatedValue, child) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * animatedValue,
                    width: width,
                    color: fillColor,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '$value/$maxValue',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

