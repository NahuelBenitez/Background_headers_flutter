import 'package:flutter/material.dart';
import './widgets/slides.dart';
import './widgets/dots.dart';

class SlideshowOnboardingPage extends StatelessWidget {
  const SlideshowOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: Slides()),
          Dots(),
        ],
      ),
    );
  }
}
