import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';

class PersonalDataButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isSelected;

  const PersonalDataButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.isSelected,
    this.subtitle,
  });

  Color get _fillColor => isSelected ? AppColors.lightPink : AppColors.white;

  Color get _borderColor => isSelected ? AppColors.lilac : AppColors.darkGrey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: _borderColor, width: 2),
          borderRadius: .circular(18),
          color: _fillColor,
        ),
        child: InkWell(
          borderRadius: .circular(18),
          onTap: onTap,
          child: Center(
            child: subtitle == null
                ? Row(
                    mainAxisAlignment: .center,
                    children: [
                      Icon(icon),
                      const SizedBox(width: 10),
                      Text(title, style: AppTextStyles.body),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(icon),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: .start,
                          mainAxisSize: .min,
                          children: [
                            Text(title, style: AppTextStyles.body),
                            Text(subtitle!, style: AppTextStyles.subtitle),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
