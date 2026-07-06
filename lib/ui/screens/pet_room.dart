import 'package:flutter/material.dart';
import '../widgets/pet_widgets.dart';

class PetRoom extends StatefulWidget {
  const PetRoom({super.key});

  @override
  State<PetRoom> createState() => _PetRoomState();
}

class _PetRoomState extends State<PetRoom> {
  late final PageController _controller;
  static const _pages = [
    'assets/images/Main room.png',
    'assets/images/outdoor_backdrop.png',
    'assets/images/kitchen_backdrop.png',
  ];

  // start in the middle of a large range so modulo mapping appears infinite
  static const int _initialPageMultiplier = 1000;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _pages.length * _initialPageMultiplier);
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
          // PageView as the changing background
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final pageIndex = index % _pages.length;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_pages[pageIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          // Static centered Milo widget (ignores pointer to allow swipes through)
          IgnorePointer(
            ignoring: true,
            child: Center(child: miloWidget),
          ),

          // Controls row at bottom (kept interactive)
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(onTap: () => _jumpToPage(2), child: kitchenDir),
                  const SizedBox(width: 12),
                  GestureDetector(onTap: () => _jumpToPage(1), child: outdoorDir),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _jumpToPage(int pageIndex) {
    // Jump to the nearest page with the requested pageIndex (modulo mapping)
    final current = _controller.page?.round() ?? _controller.initialPage;
    // find the closest target page that maps to pageIndex
    int target = current - (current % _pages.length) + pageIndex;
    // animate to target
    _controller.animateToPage(target, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}