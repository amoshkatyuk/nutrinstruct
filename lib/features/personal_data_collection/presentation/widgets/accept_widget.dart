import 'package:flutter/material.dart';

class AcceptWidget extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const AcceptWidget({
    super.key,
    this.size = 100,
    this.color = Colors.green,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<AcceptWidget> createState() => _AcceptWidgetState();
}

class _AcceptWidgetState extends State<AcceptWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scale;
  late Animation<double> _check;
  late Animation<double> _secondScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    // 0 → 60% времени: круг
    _scale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );

    // 60 → 100% времени: галочка
    _check = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
    );

    _secondScale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0),
    );

    _controller.forward(); // автозапуск
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 1.4,
      height: widget.size * 1.4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔵 Второй круг (сзади)
          AnimatedBuilder(
            animation: _secondScale,
            builder: (_, _) {
              if (_secondScale.value < 0.01) {
                return const SizedBox();
              }

              return Opacity(
                opacity: 1 - _secondScale.value, // эффект затухания
                child: Transform.scale(
                  scale: 1 + (_secondScale.value * 0.5),
                  // растёт больше основного
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

          // 🟢 Основной круг
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
                  final showCheck = _controller.value > 0.3;

                  if (!showCheck) return const SizedBox();

                  return CustomPaint(painter: _CheckPainter(_check.value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckPainter extends CustomPainter {
  final double progress;

  _CheckPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = size.width * 0.1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    path.moveTo(size.width * 0.3, size.height * 0.55);
    path.lineTo(size.width * 0.45, size.height * 0.7);
    path.lineTo(size.width * 0.73, size.height * 0.4);

    final metric = path.computeMetrics().first;

    final extractPath = metric.extractPath(0, metric.length * progress);

    canvas.drawPath(extractPath, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
