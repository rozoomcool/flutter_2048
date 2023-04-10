import 'package:flutter/material.dart';
import 'package:tilesgame/widget/cell_empty_widget.dart';
import 'package:tilesgame/widget/cell_widget.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8)
      ),
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
        itemBuilder: (BuildContext context, int index) => index%3==0 ? Cell(index: index) : const CellEmpty(),
      ),
    );
  }
}
