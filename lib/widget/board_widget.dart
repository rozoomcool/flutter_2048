import 'package:flutter/material.dart';
import 'package:tilesgame/widget/cell_widget.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8
            ),
        itemCount: 16,
        itemBuilder: (BuildContext context, int index) => Cell(index: index),
      ),
    );
  }
}
