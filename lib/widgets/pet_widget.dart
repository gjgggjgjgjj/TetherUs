import 'package:flutter/material.dart';

class PetWidget extends StatefulWidget {
  final double hunger;

  const PetWidget({super.key, required this.hunger});

  @override
  State<PetWidget> createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.95,
      upperBound: 1.05,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color getColor() {
    if (widget.hunger < 30) return Colors.green;
    if (widget.hunger < 70) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: controller,
      child: GestureDetector(
        onTap: () {
          controller.forward(from: 0.9);
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(75),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: const Center(
            child: Text(
              "🙂",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}