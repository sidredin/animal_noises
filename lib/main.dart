import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimalNoisesApp());

class AnimalNoisesApp extends StatelessWidget {
  final int imagesInRow = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}

class Animal extends StatelessWidget {
  final String name;
  final AudioCache player;
  const Animal({Key key, this.name, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        player.play('$name.wav');
      },
      child: Image.asset(
        '$name.jpg',
      ),
    );
  }
}
