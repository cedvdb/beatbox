import 'package:beatbox/widgets/buttons/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  final Function() onPressedStart;
  final Function() onPressedStop;
  final bool enabled;

  const RecordButton({
    required this.onPressedStart,
    required this.onPressedStop,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTapDown: enabled ? (_) => onPressedStart() : null,
      onLongPressEnd: enabled ? (_) => onPressedStop() : null,
      child: RoundedIconButton(
        onPressed: enabled ? () {} : null,
        iconData: Icons.mic,
      ),
    );
  }
}
