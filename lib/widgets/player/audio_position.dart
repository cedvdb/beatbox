import 'package:flutter/foundation.dart';

class AudioPosition {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  const AudioPosition(this.position, this.bufferedPosition, Duration duration)
      // web does not have duration currently
      // https://github.com/ryanheise/just_audio/issues/218
      : duration = kIsWeb ? bufferedPosition : duration;
  const AudioPosition.zero()
      : this(Duration.zero, Duration.zero, Duration.zero);
}
