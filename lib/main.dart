import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  static const List<MaterialColor> colorList = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 1; i < 8; i++)
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final player = AudioPlayer();
                      await player.play(AssetSource('note$i.wav'));
                    },
                    child: Text(''),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(colorList[i - 1])),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
