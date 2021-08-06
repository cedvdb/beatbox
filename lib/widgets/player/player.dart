import 'package:beatbox/widgets/buttons/stop_button.dart';
import 'package:beatbox/widgets/player/player_bloc.dart';
import 'package:beatbox/widgets/player/player_state.dart';
import 'package:beatbox/widgets/player/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../buttons/play_button.dart';

class Player extends StatelessWidget {
  final String path;

  const Player(this.path);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => PlayerBloc(path),
      child: PlayerView(),
    );
  }
}

class PlayerView extends StatefulWidget {
  const PlayerView();

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (ctx, state) {
        return state is Loading
            ? CircularProgressIndicator()
            : Row(
                children: [
                  PlayButton(
                    isPlaying: state is Playing,
                    onPlay: () => ctx.read<PlayerBloc>().play(),
                    onPause: () => ctx.read<PlayerBloc>().pause(),
                  ),
                  StopButton(
                    isPlaying: state is Playing,
                    onStop: () => ctx.read<PlayerBloc>().stop(),
                  ),
                  SeekBar(
                    duration: state.progress.duration,
                    position: state.progress.position,
                    bufferedPosition: state.progress.bufferedPosition,
                  ),
                ],
              );
      },
    );
  }
}
