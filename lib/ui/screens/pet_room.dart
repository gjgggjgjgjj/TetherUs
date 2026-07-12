import 'package:TetherUs/database/read_write.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/pet_widgets.dart';
import 'outdoor.dart';
import '../widgets/ui_hubbar.dart';
import 'kitchen.dart';
import 'bedroom.dart';

class PetRoom extends StatefulWidget {
  const PetRoom({super.key});

  @override
  State<PetRoom> createState() => _PetRoomState();
}

class _PetRoomState extends State<PetRoom> {
  late final PageController _controller;

  // Provide full-widget pages. Replace placeholders with your actual widgets
  // (for example, `Outdoor()` and `Kitchen()` are imported above).
  final List<Widget> _pageWidgets = [
    // Main room as a simple decorated box using the original background image
    Stack(
      children: [
        SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: const AssetImage('assets/images/Main room.png'), fit: BoxFit.cover),
            ),
          ),
        ),

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
      
    // Use the full-screen widgets if desired (they return Scaffold currently).
    Outdoor(),
    Kitchen(),
    Bedroom(),
  ];

  static const int _initialPageMultiplier = 1000;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _pageWidgets.length * _initialPageMultiplier);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView rendering widgets full-screen
          PageView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              final pageIndex = index % _pageWidgets.length;
              return SizedBox.expand(child: _pageWidgets[pageIndex]);
            },
          ),

          //place ui on top of screen
          FutureBuilder<String?>(
            future: getUsername(),
            builder: (context, snapshot) {
              final name = snapshot.connectionState == ConnectionState.done
                  ? (snapshot.data ?? 'Guest')
                  : 'Loading...';
              return GameProfileHub(uid: name);
            },
          ),
          // Static centered Milo widget (ignores pointer to allow swipes through)
          Center(child: miloWidget),

          // Controls row at bottom (kept interactive)
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GestureDetector(onTap: () => _jumpToPage(2), child: kitchenDir),
                  // const SizedBox(width: 12),
                  // GestureDetector(onTap: () => _jumpToPage(1), child: outdoorDir),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _jumpToPage(int pageIndex) {
    final current = (_controller.page ?? _controller.initialPage).round();
    final int target = current - (current % _pageWidgets.length) + pageIndex;
    _controller.animateToPage(target, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}