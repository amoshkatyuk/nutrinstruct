import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/gradients/app_gradients.dart';

class Ellipsis extends StatelessWidget {
  final double dimension;

  const Ellipsis({super.key, this.dimension = 20});

  const Ellipsis.custom({super.key, required this.dimension});

  Widget _buildCircle() {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        shape: .circle,
        gradient: AppGradients.cryLimeGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        _buildCircle(),
        const SizedBox(width: 6),
        _buildCircle(),
        const SizedBox(width: 6),
        _buildCircle(),
      ],
    );
  }
}
