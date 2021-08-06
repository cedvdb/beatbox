import 'package:beatbox/widgets/player/audio_position.dart';
import 'package:beatbox/widgets/player/player_service.dart';
import 'package:beatbox/widgets/player/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PlayerBloc extends Cubit<PlayerState> {
  PlayerService _playerService = PlayerService();

  PlayerBloc(String path)
      : super(PlayerState(Status.loading, AudioPosition.zero())) {
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
    emit(state.copyWith(status: Status.playing));
  }

  pause() {
    print('pause');
    _playerService.pause();
    emit(state.copyWith(status: Status.paused));
  }

  stop() {
    _playerService.stop();
    emit(state.copyWith(status: Status.stopped));
  }
}
