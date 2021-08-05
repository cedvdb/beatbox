import 'package:beatbox/widgets/beat_machine/beat_machine_bloc.dart';
import 'package:beatbox/widgets/beat_machine/beat_machine_state.dart';
import 'package:beatbox/widgets/player/player.dart';
import 'package:beatbox/widgets/recorder/recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeatMachine extends StatelessWidget {
  const BeatMachine();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => BeatMachineBloc(), child: BeatMachineView());
  }
}

class BeatMachineView extends StatelessWidget {
  const BeatMachineView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeatMachineBloc, BeatMachineState>(
        builder: (ctx, state) {
      if (state is Recording)
        return Recorder(
            onComplete: (path) => ctx.read<BeatMachineBloc>().play(path));
      if (state is Playing) return Player(state.path);
      return Container();
    });
  }
}
