import 'package:beatbox/widgets/buttons/stop_button.dart';
import 'package:beatbox/widgets/player/audio_position.dart';
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
    return BlocSelector<PlayerBloc, PlayerState, Status>(
      selector: (state) => state.status,
      builder: (ctx, status) {
        return status == Status.loading
            ? CircularProgressIndicator()
            : Row(
                children: [
                  PlayButton(
                    isPlaying: status == Status.playing,
                    onPlay: () => ctx.read<PlayerBloc>().play(),
                    onPause: () => ctx.read<PlayerBloc>().pause(),
                  ),
                  StopButton(
                    isPlaying: status == Status.playing,
                    onStop: () => ctx.read<PlayerBloc>().stop(),
                  ),
                  BlocSelector<PlayerBloc, PlayerState, AudioPosition>(
                    selector: (state) => state.progress,
                    builder: (ctx, progress) => SeekBar(
                      duration: progress.duration,
                      position: progress.position,
                      bufferedPosition: progress.bufferedPosition,
                      onChangeEnd: (position) =>
                          context.read<PlayerBloc>().seek(position),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
