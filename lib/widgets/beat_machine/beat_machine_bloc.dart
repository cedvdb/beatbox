import 'package:beatbox/widgets/beat_machine/beat_machine_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeatMachineBloc extends Cubit<BeatMachineState> {
  BeatMachineBloc() : super(Recording());

  void record() => emit(Recording());

  void play(String path) => emit(Playing(path));

  void edit() => emit(Editing());
}
