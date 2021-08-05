import 'package:just_audio/just_audio.dart';

class PlayerService {
  AudioPlayer _audioPlayer = AudioPlayer();

  Future<Duration?> load(String path) {
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
