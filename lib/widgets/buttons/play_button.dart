import 'package:flutter/material.dart';

import 'rounded_button.dart';

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
    print(widget.isPlaying);
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
    print('did update');
    super.didUpdateWidget(old);
    if (old.isPlaying == widget.isPlaying) return;
    if (widget.isPlaying)
      _playCtrl.reverse();
    else
      _playCtrl.forward();
  }

  void toggle() {
    if (widget.isPlaying) {
      widget.onPause();
    } else {
      widget.onPlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onPressed: toggle,
      child: AnimatedIcon(icon: AnimatedIcons.pause_play, progress: _playCtrl),
    );
  }
}
