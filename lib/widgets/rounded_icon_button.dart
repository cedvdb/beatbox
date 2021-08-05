import 'package:beatbox/theme/spacing.dart';
import 'package:beatbox/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Color? background;
  final Color? foreground;
  final Function()? onPressed;
  final IconData iconData;

  const RoundedIconButton({
    required this.onPressed,
    required this.iconData,
    this.background,
    this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      background: background,
      child: Icon(
        iconData,
        size: 20,
        color: foreground,
      ),
      onPressed: onPressed,
    );
  }
}
