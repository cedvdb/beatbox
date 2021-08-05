import 'package:flutter/material.dart';

import '../rounded_button.dart';

class PlayButton extends StatefulWidget {
  final bool isPlaying;
  final Function() onPlay;
  final Function() onPause;

  PlayButton({
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
  });

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _playCtrl;

  @override
  void initState() {
    super.initState();
    _playCtrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _playCtrl.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PlayButton old) {
    super.didUpdateWidget(old);
    if (old.isPlaying == widget.isPlaying) return;
    if (widget.isPlaying)
      _playCtrl.forward();
    else
      _playCtrl.reverse();
  }

  void toggle() {
    final isPlaying = _playCtrl.status == AnimationStatus.dismissed;
    if (isPlaying) {
      widget.onPlay();
    } else {
      widget.onPause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onPressed: toggle,
      child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _playCtrl),
    );
  }
}
