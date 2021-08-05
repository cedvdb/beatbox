class BeatMachineState {}

class Recording extends BeatMachineState {}

class Playing extends BeatMachineState {
  final String path;

  Playing(this.path);
}

class Editing extends BeatMachineState {}
