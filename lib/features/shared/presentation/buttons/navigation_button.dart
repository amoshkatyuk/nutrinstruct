import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';

class NavigationButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final VoidCallback onTap;

  const NavigationButton({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.onTap,
  });

  const NavigationButton.square({
    super.key,
    required double size,
    required this.icon,
    required this.onTap,
  }) : width = size,
       height = size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: .circular(18),
        ),
        child: InkWell(
          borderRadius: .circular(18),
          onTap: onTap,
          child: Center(child: Icon(icon, size: 20, color: AppColors.dark)),
        ),
      ),
    );
  }
}
