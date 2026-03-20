import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';

class NutrientCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;

  const NutrientCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(color: color, borderRadius: .circular(18)),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: .center,
        children: [
          Column(
            mainAxisSize: .min,
            children: [
              Icon(icon),
              Text(title, style: AppTextStyles.nutrientCardNormal),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(subtitle, style: AppTextStyles.nutrientCardBold),
            ),
          ),
        ],
      ),
    );
  }
}
