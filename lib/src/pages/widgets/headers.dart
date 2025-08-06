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


class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalClipper(),
      child: Container(
        height: 600,
        color: Colors.blueAccent,
       
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100); 
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); 
    path.close(); 

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        height: 900,
        color: Colors.blueAccent,
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height); // punta del triángulo en el centro abajo
    path.lineTo(size.width, 0); // top-right
    path.close(); // cierra al punto (0,0)

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}