class RecorderState {
  const RecorderState();
}

class NotRecording extends RecorderState {
  const NotRecording();
}

class Recording extends RecorderState {
  final Duration duration;
  const Recording(this.duration);
}

class RecordingCompleted extends RecorderState {
  final String path;
  final Duration duration;
  const RecordingCompleted(this.path, this.duration);
}
