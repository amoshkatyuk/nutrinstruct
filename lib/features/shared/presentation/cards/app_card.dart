import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
  });

  const AppCard.noPadding({super.key, required this.child})
    : padding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 14),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: AppColors.grey,
          shape: RoundedRectangleBorder(borderRadius: .circular(26)),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
