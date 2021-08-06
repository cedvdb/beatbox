class AudioPosition {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  const AudioPosition(this.position, this.bufferedPosition, this.duration);
  const AudioPosition.zero()
      : this(Duration.zero, Duration.zero, Duration.zero);
}
