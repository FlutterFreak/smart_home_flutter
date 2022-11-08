import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ChipButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color? forgroundColor;
  const ChipButton({
    Key? key,
    this.onPressed,
    this.child,
    this.backgroundColor,
    this.forgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: forgroundColor ?? AppColors.tertiary,
        onPressed: onPressed ?? () {},
        child: child,
      ),
    );
  }
}
