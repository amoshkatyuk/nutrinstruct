import 'package:flutter/material.dart';

class DenyWidget extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const DenyWidget({
    super.key,
    this.size = 100,
    this.color = Colors.red,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<DenyWidget> createState() => _DenyWidgetState();
}

class _DenyWidgetState extends State<DenyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scale;
  late Animation<double> _cross;
  late Animation<double> _secondScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _scale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );

    _cross = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
    );

    _secondScale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 1.4,
      height: widget.size * 1.4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔴 Волна сзади
          AnimatedBuilder(
            animation: _secondScale,
            builder: (_, __) {
              if (_secondScale.value < 0.01) {
                return const SizedBox();
              }

              return Opacity(
                opacity: 1 - _secondScale.value,
                child: Transform.scale(
                  scale: 1 + (_secondScale.value * 0.5),
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: widget.color.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),

          // 🔴 Основной круг + крест
          ScaleTransition(
            scale: _scale,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  final showCross = _controller.value > 0.3;

                  if (!showCross) return const SizedBox();

                  return CustomPaint(painter: _CrossPainter(_cross.value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final double progress;

  _CrossPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = size.width * 0.1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    final topLeft = Offset(size.width * 0.33, size.height * 0.33);
    final topRight = Offset(size.width * 0.67, size.height * 0.33);
    final bottomLeft = Offset(size.width * 0.33, size.height * 0.67);
    final bottomRight = Offset(size.width * 0.67, size.height * 0.67);

    // 🔴 линия 1: topLeft → center → bottomRight
    final path1 = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
      ..lineTo(center.dx, center.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy);

    // 🔴 линия 2: topRight → center → bottomLeft
    final path2 = Path()
      ..moveTo(topRight.dx, topRight.dy)
      ..lineTo(center.dx, center.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy);

    _drawProgress(canvas, path1, paint, progress);
    _drawProgress(canvas, path2, paint, progress);
  }

  void _drawProgress(Canvas canvas, Path path, Paint paint, double progress) {
    final metric = path.computeMetrics().first;

    final extract = metric.extractPath(0, metric.length * progress);

    canvas.drawPath(extract, paint);
  }

  @override
  bool shouldRepaint(covariant _CrossPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
