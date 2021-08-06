import 'package:beatbox/widgets/player/audio_position.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PlayerService {
  AudioPlayer _audioPlayer = AudioPlayer();
  Stream<AudioPosition> get progress$ =>
      CombineLatestStream<Duration, AudioPosition>(
        [
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream.map((d) => d ?? Duration.zero)
        ],
        (changes) => AudioPosition(changes[0], changes[1], changes[2]),
      );

  Future<Duration?> load(String path) {
    _audioPlayer.setLoopMode(LoopMode.all);
    return _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(path)));
  }

  play() {
    return _audioPlayer.play();
  }

  pause() {
    return _audioPlayer.pause();
  }

  stop() {
    return _audioPlayer.stop();
  }

  seek(Duration position) {
    return _audioPlayer.seek(position);
  }
}
