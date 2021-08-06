import 'package:beatbox/widgets/player/audio_position.dart';

class PlayerState {
  final AudioPosition progress;

  const PlayerState(this.progress);

  PlayerState copyWith({
    AudioPosition? progress,
  }) {
    return PlayerState(
      progress ?? this.progress,
    );
  }
}

class Loading extends PlayerState {
  const Loading() : super(const AudioPosition.zero());
}

class Playing extends PlayerState {
  final Duration duration;
  Playing(this.duration, AudioPosition progress) : super(progress);
}

class Paused extends PlayerState {
  final Duration duration;
  Paused(this.duration, AudioPosition progress) : super(progress);
}

class Stopped extends PlayerState {
  const Stopped() : super(const AudioPosition.zero());
}
