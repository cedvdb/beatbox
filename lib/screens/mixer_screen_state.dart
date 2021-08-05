class MixerScreenState {
  final int machines;

  MixerScreenState({required this.machines});

  MixerScreenState copyWith({
    int? machines,
  }) {
    return MixerScreenState(
      machines: machines ?? this.machines,
    );
  }
}
