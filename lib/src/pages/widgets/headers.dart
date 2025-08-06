import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.blueAccent,
    );
  }
}


class HeaderCircular extends StatelessWidget {
  const HeaderCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
    );
  }
}
