import 'package:beatbox/screens/mixer_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MixerScreenBloc extends Cubit<MixerScreenState> {
  MixerScreenBloc() : super(MixerScreenState(machines: 1));

  addMachine() {
    emit(state.copyWith(machines: state.machines + 1));
  }
}
