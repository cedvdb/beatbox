import 'package:beatbox/theme/spacing.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color? background;
  final Function()? onPressed;
  final Widget child;

  const RoundedButton({
    required this.onPressed,
    required this.child,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: const EdgeInsets.all(Spacing.m),
        primary: background,
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
