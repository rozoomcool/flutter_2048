import 'package:flutter/material.dart';
import 'package:tilesgame/domain/consts.dart';

class Cell extends StatelessWidget {
  final int value;

  const Cell({super.key, required this.value});

  // final textStyle = const TextStyle(
  //     color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final Color color = value == 2
        ? Colors.teal
        : value == 4
            ? Colors.green
            : value == 8
                ? Colors.tealAccent
                : value == 16
                    ? Colors.lightGreen
                    : value == 32
                        ? Colors.indigo
                        : value == 64
                            ? Colors.blue
                            : value == 128
                                ? Colors.purple
                                : value == 256
                                    ? Colors.amber
                                    : value == 512
                                        ? Colors.red
                                        : Colors.pink;

    return Container(
      decoration: BoxDecoration(
          color: context
              .findAncestorWidgetOfExactType<MaterialApp>()
              ?.theme
              ?.scaffoldBackgroundColor,
          boxShadow: [
            blurShadow(
                color, neonBlur, neonSecondarySpread)
          ],
          border: Border.all(width: 3, color: color),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          '$value',
          style: gameTileText.copyWith(color: color),
        ),
      ),
    );
  }
}
