import 'package:beatbox/widgets/recorder/recorder_bloc.dart';
import 'package:beatbox/widgets/recorder/recorder_state.dart';
import 'package:beatbox/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => RecorderBloc(),
      child: RecorderView(),
    );
  }
}

class RecorderView extends StatelessWidget {
  const RecorderView();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RecordButton(
          onPressedStart: () => context.read<RecorderBloc>().record(),
          onPressedStop: () => context.read<RecorderBloc>().stopRecording(),
        ),
        BlocBuilder<RecorderBloc, RecorderState>(
          builder: (ctx, state) {
            if (state is NotRecording) {
              return Text('not recording');
            }
            if (state is Recording) {
              return RecordingLabel(state.duration);
            }
            if (state is RecordingCompleted) {
              return RecordingLabel(
                state.duration,
                isRecording: false,
              );
            }
            return Container();
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
