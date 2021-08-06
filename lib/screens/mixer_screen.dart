import 'package:beatbox/screens/mixer_screen_bloc.dart';
import 'package:beatbox/screens/mixer_screen_state.dart';
import 'package:beatbox/widgets/beat_machine/beat_machine.dart';
import 'package:beatbox/widgets/player/player.dart';
import 'package:beatbox/widgets/recorder/recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MixerScreen extends StatelessWidget {
  const MixerScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeatBox'),
      ),
      body: BlocProvider(
        create: (ctx) => MixerScreenBloc(),
        child: MixerView(),
      ),
    );
  }
}

class MixerView extends StatelessWidget {
  const MixerView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MixerScreenBloc, MixerScreenState>(
      builder: (ctx, state) => Column(
        children: List.filled(state.machines, 0)
            .map(
              (e) => Card(
                child: BeatMachine(
                  onRecordCompleted: () =>
                      ctx.read<MixerScreenBloc>().addMachine(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
