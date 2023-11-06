// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  AudioCache audioCache = AudioCache();

  void playNote(int note) {
    // audioCache.play('/assets/audios/note$note.wav');
    final player = AudioPlayer();
    player.play(AssetSource('audios/note$note.wav'));
  }

  Widget buildKey(
      {required Color colorKey, required int note, required String notas}) {
    return Expanded(
      child: Container(
        color: colorKey,
        child: TextButton(
          onPressed: () {
            playNote(note);
          },
          child: Text(notas,
              style: TextStyle(fontSize: 25.0, color: Colors.white)),
        ),
      ),
    );
  }

  late List<Map<String, dynamic>> teclas = [
    {
      "id": 1,
      "color": Colors.pink,
      "nota": "Do",
    },
    {
      "id": 2,
      "color": Colors.indigo,
      "nota": "Re",
    },
    {
      "id": 3,
      "color": Colors.green,
      "nota": "Mi",
    },
    {
      "id": 4,
      "color": Colors.yellow,
      "nota": "Fa",
    },
    {
      "id": 5,
      "color": Colors.orange,
      "nota": "Sol",
    },
    {
      "id": 6,
      "color": Colors.brown,
      "nota": "La",
    },
    {
      "id": 7,
      "color": Colors.blue,
      "nota": "Si",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Xylophone"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //buildKey(colorKey: Colors.pink, note: 1, notas: "Do"),
          //buildKey(colorKey: Colors.indigo, note: 2, notas: "Re"),
          //buildKey(colorKey: Colors.green, note: 3, notas: "Mi"),
          //buildKey(colorKey: Colors.yellow, note: 4, notas: "Fa"),
          //buildKey(colorKey: Colors.orange, note: 5, notas: "Sol"),
          //buildKey(colorKey: Colors.brown, note: 6, notas: "La"),
          //buildKey(colorKey: Colors.blue, note: 7, notas: "Si"),

          ...teclas
              .map((e) => buildKey(
                  colorKey: e["color"], note: e["id"], notas: e["nota"]))
              .toList(),
        ],
      ),
    );
  }
}
