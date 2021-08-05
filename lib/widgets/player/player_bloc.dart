import 'package:beatbox/widgets/player/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerBloc extends Cubit<PlayerState> {
  PlayerBloc() : super(Stopped());

  play() {
    emit(Playing(Duration(seconds: 1)));
  }

  pause() {
    emit(Paused(Duration(seconds: 1)));
  }

  stop() {
    emit(Stopped());
  }
}
