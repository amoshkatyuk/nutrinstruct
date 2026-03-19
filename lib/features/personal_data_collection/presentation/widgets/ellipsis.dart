import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/gradients/app_gradients.dart';

class Ellipsis extends StatefulWidget {
  final double dimension;

  const Ellipsis({super.key, this.dimension = 12});

  @override
  State<Ellipsis> createState() => _EllipsisState();
}

class _EllipsisState extends State<Ellipsis>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _animations = List.generate(3, (index) {
      final start = index * 0.2;
      final end = start + 0.6;

      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(
            begin: 0.6,
            end: 1.2,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 1.2,
            end: 0.6,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 50,
        ),
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end.clamp(0.0, 1.0)),
        ),
      );
    });
  }

  Widget _buildCircle(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return Transform.scale(scale: animation.value, child: child);
      },
      child: SizedBox(
        width: widget.dimension,
        height: widget.dimension,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppGradients.cryLimeGreen,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3 * 2 - 1, (i) {
        if (i.isEven) {
          return _buildCircle(_animations[i ~/ 2]);
        }
        return const SizedBox(width: 6);
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
