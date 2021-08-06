import 'package:beatbox/widgets/player/player_service.dart';
import 'package:beatbox/widgets/player/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PlayerBloc extends Cubit<PlayerState> {
  PlayerService _playerService = PlayerService();

  PlayerBloc(String path) : super(Loading()) {
    _init(path);
  }

  _init(String path) async {
    await _playerService.load(path);
    _playerService.progress$
        .takeUntil(Stream.fromFuture(_playerService.progress$.drain()))
        .listen((progress) => emit(state.copyWith(progress: progress)));
    play();
  }

  play() {
    print('play');
    _playerService.play();
    emit(Playing(Duration(seconds: 1), state.progress));
  }

  pause() {
    print('pause');
    _playerService.pause();
    emit(Paused(Duration(seconds: 1), state.progress));
  }

  stop() {
    _playerService.stop();
    emit(Stopped());
  }
}
