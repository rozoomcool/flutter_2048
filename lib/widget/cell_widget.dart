import 'package:flutter/material.dart';
import 'package:tilesgame/domain/consts.dart';

class Cell extends StatefulWidget {
  final int value;

  const Cell({super.key, required this.value});

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  // final textStyle = const TextStyle(
  @override
  Widget build(BuildContext context) {
    final Color color = widget.value == 2
        ? Colors.teal
        : widget.value == 4
            ? Colors.green
            : widget.value == 8
                ? Colors.tealAccent
                : widget.value == 16
                    ? Colors.lightGreen
                    : widget.value == 32
                        ? Colors.indigo
                        : widget.value == 64
                            ? Colors.blue
                            : widget.value == 128
                                ? Colors.purple
                                : widget.value == 256
                                    ? Colors.amber
                                    : widget.value == 512
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
          '${widget.value}',
          style: gameTileText.copyWith(color: color),
        ),
      ),
    );
  }
}
