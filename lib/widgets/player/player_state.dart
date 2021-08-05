class PlayerState {}

class Loading extends PlayerState {}

class Playing extends PlayerState {
  final Duration duration;
  Playing(this.duration);
}

class Paused extends PlayerState {
  final Duration duration;
  Paused(this.duration);
}

class Stopped extends PlayerState {}
