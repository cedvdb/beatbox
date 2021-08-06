import 'package:beatbox/widgets/player/audio_position.dart';

enum Status { loading, playing, paused, stopped }

class PlayerState {
  // we use a stream here to not
  final AudioPosition progress;
  final Status status;

  const PlayerState(this.status, this.progress);

  PlayerState copyWith({
    AudioPosition? progress,
    Status? status,
  }) {
    return PlayerState(
      status ?? this.status,
      progress ?? this.progress,
    );
  }
}
