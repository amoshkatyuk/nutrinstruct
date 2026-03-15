import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/assets/gradients/app_gradients.dart';

class GradientButton extends StatelessWidget {
  final double? width;
  final double height;
  final VoidCallback onTap;
  final String title;
  final IconData? icon;

  const GradientButton({
    super.key,
    this.width,
    required this.height,
    required this.onTap,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: .circular(18),
          gradient: AppGradients.lilacBlue,
        ),
        child: InkWell(
          borderRadius: .circular(18),
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisSize: .min,
              children: [
                Text(title, style: AppTextStyles.buttonText),
                if (icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(icon, size: 20, color: AppColors.white),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
