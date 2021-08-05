import 'package:beatbox/widgets/player/player_service.dart';
import 'package:beatbox/widgets/player/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerBloc extends Cubit<PlayerState> {
  PlayerService _playerService = PlayerService();

  PlayerBloc(String path) : super(Loading()) {
    _init(path);
  }

  _init(String path) async {
    await _playerService.load(path);
    play();
  }

  play() {
    _playerService.play();
    emit(Playing(Duration(seconds: 1)));
  }

  pause() {
    _playerService.pause();
    emit(Paused(Duration(seconds: 1)));
  }

  stop() {
    _playerService.stop();
    emit(Stopped());
  }
}
