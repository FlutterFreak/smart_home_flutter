import 'package:flutter/material.dart';

import '../../../utils/resources.dart';

enum BtnState { active, inactive }

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    Key? key,
    this.onPressed,
    required this.label,
    this.btnColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = btnColor ?? AppColors.primary;
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: effectiveBackgroundColor,
          backgroundColor: effectiveBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: TextStyles.body.copyWith(color: AppColors.tertiary),
        ),
      ),
    );
  }
}
