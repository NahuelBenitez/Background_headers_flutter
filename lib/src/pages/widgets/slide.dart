import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Slide extends StatelessWidget {
  final String svgPath;
  const Slide(this.svgPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svgPath),
    );
  }
}
