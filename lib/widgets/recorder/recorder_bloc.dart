import 'package:beatbox/widgets/recorder/recorder.service.dart';
import 'package:beatbox/widgets/recorder/recorder_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RecorderBloc extends Cubit<RecorderState> {
  RecorderService _recorderSrv = RecorderService();

  RecorderBloc() : super(const NotRecording());

  record() {
    if (state is Recording) return;
    _recorderSrv
        .record()
        .takeUntil(Stream.fromFuture(this.stream.drain()))
        .doOnCancel(() {
      print('close');
    }).listen((duration) {
      emit(Recording(duration));
    });
  }

  stopRecording() async {
    final state = this.state;
    if (state is Recording) {
      final path = await _recorderSrv.stop();
      emit(RecordingCompleted(path, state.duration));
    }
  }
}
