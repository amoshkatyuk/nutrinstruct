import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCircularLoader extends StatefulWidget {
  final double size;
  final Color color;

  const CustomCircularLoader({
    super.key,
    this.size = 48,
    this.color = Colors.blue,
  });

  @override
  State<CustomCircularLoader> createState() => _CustomCircularLoaderState();
}

class _CustomCircularLoaderState extends State<CustomCircularLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, _) {
          return CustomPaint(
            painter: _LoaderPainter(
              progress: controller.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}

class _LoaderPainter extends CustomPainter {
  final double progress; // 0..1
  final Color color;

  _LoaderPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // Базовый круг, по нему движется дуга
    final basePaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawCircle(center, radius, basePaint);

    // --- параметры ---
    const baseStroke = 8.0;

    final minSweep = 0.2; // почти точка
    const maxSweep = pi / 2;

    final t = Curves.easeInOutSine.transform(progress);

    // асимметричная кривая
    final wave = 1 - pow(sin(t * pi), 2).toDouble();

    // длина дуги
    final sweep = lerpDouble(minSweep, maxSweep, wave)!;

    // толщина дуги
    final strokeWidth = baseStroke;

    final rotation = progress * 4 * pi;

    final head = rotation;
    final tail = rotation - sweep;

    final activePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2;

    canvas.save();
    canvas.translate(center.dx, center.dy);

    final rect = Rect.fromCircle(center: Offset.zero, radius: radius);

    canvas.drawArc(rect, startAngle + tail, head - tail, false, activePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _LoaderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
