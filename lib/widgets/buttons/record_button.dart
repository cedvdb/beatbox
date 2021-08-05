import 'package:beatbox/widgets/buttons/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  final Function() onPressedStart;
  final Function() onPressedStop;

  const RecordButton({
    required this.onPressedStart,
    required this.onPressedStop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onLongPressStart: (_) => onPressedStart(),
      onLongPressEnd: (_) => onPressedStop(),
      child: RoundedIconButton(
        onPressed: () {},
        iconData: Icons.mic,
      ),
    );
  }
}
