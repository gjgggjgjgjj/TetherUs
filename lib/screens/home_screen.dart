import 'dart:async';
import 'package:TetherUs/screens/first_timer.dart';
import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/pet_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
        child: SafeArea(
          child: Stack(
            children: [
              // Background Decorations
              Positioned(
                top: 20,
                left: 20,
                child: _plantDecoration(),
              ),
              Positioned(
                bottom: 30,
                right: 20,
                child: _plantDecoration(),
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Logo
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Nunito',
                            ),
                            children: [
                              TextSpan(
                                text: 'Tether',
                                style: TextStyle(
                                  color: Color(0xFF6A3D1F),
                                ),
                              ),
                              TextSpan(
                                text: 'Us',
                                style: TextStyle(
                                  color: Color(0xFF7EBF52),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 36),

                      // Pets
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 18,
                        runSpacing: 18,
                        children: const [
                          PetCard(
                            emoji: '🐱',
                            name: 'Milo',
                            color: Color(0xFFD7E8FF),
                          ),
                          PetCard(
                            emoji: '🐶',
                            name: 'Buddy',
                            color: Color(0xFFFFD8B5),
                          ),
                          PetCard(
                            emoji: '🐰',
                            name: 'Bunbun',
                            color: Color(0xFFFFF2CC),
                          ),
                          PetCard(
                            emoji: '🐼',
                            name: 'Panda',
                            color: Color(0xFFEAEAEA),
                          ),
                          PetCard(
                            emoji: '🦊',
                            name: 'Foxy',
                            color: Color(0xFFFFE0B8),
                          ),
                          PetCard(
                            emoji: '🦔',
                            name: 'Spike',
                            color: Color(0xFFE8D2BE),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Welcome Card
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: const [
                            Text(
                              'Welcome to TetherUs!',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF5B341B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'A cozy place to care, play, and grow together.',
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                color: Color(0xFF7B6A5C),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Get Started Button
                      SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {       //redirects you to the first_timer screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutTether())
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF84C857),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Login Button
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF7B6A5C),
                            ),
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                              ),
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  color: Color(0xFF6FAF48),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _plantDecoration() {
    return Opacity(
      opacity: 0.25,
      child: Icon(
        Icons.local_florist,
        size: 90,
        color: Colors.green.shade400,
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String emoji;
  final String name;
  final Color color;

  const PetCard({
    super.key,
    required this.emoji,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 46),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF5B341B),
            ),
          ),
        ],
      ),
    );
  }
}
/*

## Notes

* Replace the emoji pets with your custom sprite PNGs later using `Image.asset()`.
* Recommended font: `Nunito` or `Fredoka`.
* You can animate the pets later with `flutter_animate` or `Rive`.
* This layout is responsive and works well for both Android and iOS.
*
*/
