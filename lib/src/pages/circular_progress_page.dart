 //import 'dart:math';
 import 'package:backgrounds_styles/src/pages/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

// class CircularProgressPage extends StatefulWidget {
//   const CircularProgressPage({super.key});

//   @override
//   State<CircularProgressPage> createState() => _CircularProgressPageState();
// }

// class _CircularProgressPageState extends State<CircularProgressPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   final double porcentajeFinal = 35; // porcentaje objetivo

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     _animation = Tween<double>(begin: 0, end: porcentajeFinal).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     )..addListener(() {
//         setState(() {}); // para redibujar con nuevo valor
//       });

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Si _animation no está listo (muy raro), usamos 0 como fallback.
//     final porcentajeActual = _animation.value;

//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: SizedBox(
//           width: 300,
//           height: 300,
//           child: CustomPaint(
//             painter: _RadialProgressPainter(porcentaje: porcentajeActual),
//             child: Center(
//               child: Text(
//                 "${porcentajeActual.toInt()}%",
//                 style: const TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _RadialProgressPainter extends CustomPainter {
//   final double porcentaje;

//   _RadialProgressPainter({required this.porcentaje});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radio = min(size.width / 2, size.height / 2) - 10;

//     // Círculo base
//     final basePaint = Paint()
//       ..strokeWidth = 15
//       ..color = Colors.grey.shade300
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(center, radio, basePaint);

//     // Arco de progreso
//     final arcPaint = Paint()
//       ..strokeWidth = 20
//       ..color = Colors.blueAccent
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final arcAngle = 2 * pi * (porcentaje / 100);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radio),
//       -pi / 2,
//       arcAngle,
//       false,
//       arcPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
class CircularProgressPage extends StatelessWidget {
  const CircularProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: RadialProgress(
          porcentaje: 45,
          color: Colors.pinkAccent,
          size: 450,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
