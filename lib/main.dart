import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimalNoisesApp());

class AnimalNoisesApp extends StatelessWidget {
  final animalNames = [
    'sheep',
    'goat',
    'horse',
    'cow',
    'dog',
    'cat',
    'goose',
    'duck',
    'cock',
    'hen',
    'chicks',
    'turkey',
    'crow',
    'wolf',
    'lion',
    'tiger',
    'frog',
    'pig',
  ];
  final imagesDir = 'images';

  final AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 3,
            children: getAnimalsList(animalNames),
          ),
        ),
      ),
    );
  }

  getAnimalsList(List<String> animalNames) {
    List<Animal> animalsList = [];
    for (var name in animalNames) {
      animalsList.add(Animal(
        name: name,
        player: player,
        imagesDir: imagesDir,
      ));
    }
    return animalsList;
  }
}

class Animal extends StatelessWidget {
  final String imagesDir;
  final String name;
  final AudioCache player;
  const Animal({Key key, this.name, this.player, this.imagesDir = 'images'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        player.play('$name.wav');
      },
      child: Image.asset(
        '$imagesDir/$name.jpg',
      ),
    );
  }
}
