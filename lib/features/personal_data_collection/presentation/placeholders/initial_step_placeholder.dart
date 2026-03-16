import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/assets/gradients/app_gradients.dart';

class InitialStepPlaceholder extends StatelessWidget {
  const InitialStepPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 50,
          right: 16,
          bottom: 20,
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: AppGradients.lilacBlue,
                borderRadius: .circular(26),
              ),
              child: Center(
                child: Icon(
                  Icons.event_repeat,
                  color: AppColors.white,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text('nutrinstruct', style: AppTextStyles.header),

            const SizedBox(height: 20),

            Text(
              'Создавайте персонализированную диету с помощью ИИ-ассистента',
              style: AppTextStyles.body,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
