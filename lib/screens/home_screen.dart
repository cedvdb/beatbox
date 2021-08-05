import 'package:beatbox/widgets/player/player.dart';
import 'package:beatbox/widgets/recorder/recorder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeatBox'),
      ),
      body: Column(
        children: [
          Recorder(),
          SizedBox(height: 20),
          Player(),
        ],
      ),
    );
  }
}
