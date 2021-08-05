import 'dart:async';

import 'package:record/record.dart';

import 'record_error.dart';

class RecorderService {
  final _recorder = Record();
  StreamController<Duration>? _progress$;

  Stream<Duration> record() {
    if (_progress$ != null) throw AlreadyRecordingError();

    _recorder.start();
    _progress$ = StreamController();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_progress$ != null) {
        _progress$!.add(Duration(seconds: timer.tick));
      } else {
        timer.cancel();
      }
    });

    return _progress$!.stream.asBroadcastStream();
  }

  Future<String> stop() async {
    final path = await _recorder.stop();
    await _progress$!.close();
    _progress$ = null;
    return path!;
  }
}
