import 'package:beatbox/widgets/buttons/record_button.dart';
import 'package:beatbox/widgets/recorder/recorder_bloc.dart';
import 'package:beatbox/widgets/recorder/recorder_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recorder extends StatelessWidget {
  final Function(String) onComplete;

  Recorder({
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => RecorderBloc(),
      child: RecorderView(onComplete: onComplete),
    );
  }
}

class RecorderView extends StatelessWidget {
  final Function(String) onComplete;
  const RecorderView({
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<RecorderBloc, RecorderState>(
          builder: (ctx, state) {
            return Row(
              children: [
                RecordButton(
                  enabled: state is! NoPermissions,
                  onPressedStart: () => context.read<RecorderBloc>().record(),
                  onPressedStop: () =>
                      context.read<RecorderBloc>().stopRecording(),
                ),
                if (state is NotRecording) Text('Hold to record'),
                if (state is Recording) RecordingLabel(state.duration),
                if (state is RecordingCompleted)
                  RecordingLabel(
                    state.duration,
                    isRecording: false,
                  ),
              ],
            );
          },
          listener: (ctx, state) {
            if (state is RecordingCompleted) {
              return onComplete(state.path);
            }
          },
        ),
      ],
    );
  }
}

class RecordingLabel extends StatelessWidget {
  final Duration duration;
  final bool isRecording;
  const RecordingLabel(
    this.duration, {
    this.isRecording = true,
  });

  static String formatDuration(Duration duration) {
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isRecording)
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        if (isRecording)
          SizedBox(
            width: 4,
          ),
        Text(formatDuration(duration)),
      ],
    );
  }
}
