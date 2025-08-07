import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color color;
  final double size;
  final Duration duration;

  const RadialProgress({
    Key? key,
    required this.porcentaje,
    this.color = Colors.blueAccent,
    this.size = 150,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double oldPorcentaje = 0;

  @override
  void initState() {
    super.initState();

    oldPorcentaje = 0;

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: oldPorcentaje, end: widget.porcentaje).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant RadialProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.porcentaje != widget.porcentaje) {
      oldPorcentaje = _animation.value;
      _controller.dispose();

      _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
      );

      _animation = Tween<double>(begin: oldPorcentaje, end: widget.porcentaje).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      )..addListener(() {
          setState(() {});
        });

      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: _RadialProgressPainter(
          porcentaje: _animation.value,
          color: widget.color,
        ),
        child: Center(
          child: Text(
            "${_animation.value.toInt()}%",
            style: TextStyle(
              fontSize: widget.size * 0.3,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double porcentaje;
  final Color color;

  _RadialProgressPainter({required this.porcentaje, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radio = min(size.width / 2, size.height / 2) - 10;

    final basePaint = Paint()
      ..strokeWidth = 15
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radio, basePaint);

    final arcPaint = Paint()
      ..strokeWidth = 20
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RadialProgressPainter oldDelegate) {
    return oldDelegate.porcentaje != porcentaje || oldDelegate.color != color;
  }
}
