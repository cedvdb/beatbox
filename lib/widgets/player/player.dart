import 'package:beatbox/widgets/player/player_bloc.dart';
import 'package:beatbox/widgets/player/player_state.dart';
import 'package:beatbox/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../rounded_button.dart';
import 'play_button.dart';

class Player extends StatelessWidget {
  const Player();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => PlayerBloc(),
      child: PlayerView(),
    );
  }
}

class PlayerView extends StatefulWidget {
  const PlayerView();

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView>
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
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (ctx, state) {
      return Row(
        children: [
          PlayButton(
            isPlaying: state is Playing,
            onPlay: () => ctx.read<PlayerBloc>().play(),
            onPause: () => ctx.read<PlayerBloc>().pause(),
          ),
          RoundedIconButton(
            onPressed:
                state is Playing ? () => ctx.read<PlayerBloc>().stop() : null,
            iconData: Icons.stop,
          ),
        ],
      );
    });
  }
}
