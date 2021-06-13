import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimalNoisesApp());

class AnimalNoisesApp extends StatelessWidget {
  final int namesInRow = 3;
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
    final animalNamesMatrix = listToMatrix(animalNames, namesInRow);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: getAnimalsGrid(animalNamesMatrix),
          ),
        ),
      ),
    );
  }

  List<List<String>> listToMatrix(List<String> animalNames, int namesInRow) {
    final rowsNum = (animalNames.length / namesInRow).ceil();
    List<List<String>> animalNamesMatrix = [];
    List<String> row = [];

    for (var i = 0; i <= rowsNum; i++) {
      for (var j = i * namesInRow; j < animalNames.length; j++) {
        row.add(animalNames[j]);
        if ((j + 1) % namesInRow == 0 || j == animalNames.length - 1) {
          animalNamesMatrix.add(row);
          row = [];
          break;
        }
      }
    }
    return animalNamesMatrix;
  }

  getAnimalsGrid(List<List<String>> animalNamesMatrix) {
    List<Row> animalsGrid = [];
    for (var row in animalNamesMatrix) {
      List<Animal> rowChildren = [];
      for (var name in row) {
        rowChildren.add(Animal(
          name: name,
          player: player,
          imagesDir: imagesDir,
        ));
      }
      animalsGrid.add(
        Row(
          children: rowChildren,
        ),
      );
    }
    return animalsGrid;
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
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          player.play('$name.wav');
        },
        child: Image.asset(
          '$imagesDir/$name.jpg',
        ),
      ),
    );
  }
}
