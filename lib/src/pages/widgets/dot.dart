import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final int index;
  final double currentPage;

  const Dot({super.key, required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final bool isActive = (currentPage >= index - 0.5 && currentPage < index + 0.5);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: isActive ? 20 : 12,
      height: isActive ? 20 : 12,
      decoration: BoxDecoration(
        color: isActive ? Colors.redAccent : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
