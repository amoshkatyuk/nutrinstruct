import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';

class DataTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;

  const DataTextField({super.key, required this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.grey,

        contentPadding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 14,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.darkGrey, width: 2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.lilac, width: 2),
        ),
      ),
    );
  }
}
