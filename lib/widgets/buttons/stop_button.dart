import 'package:flutter/material.dart';

import 'rounded_icon_button.dart';

class StopButton extends StatelessWidget {
  final bool isPlaying;
  final Function() onStop;

  const StopButton({required this.isPlaying, required this.onStop});

  @override
  Widget build(BuildContext context) {
    return RoundedIconButton(
      onPressed: isPlaying ? onStop : null,
      iconData: Icons.stop,
    );
  }
}
