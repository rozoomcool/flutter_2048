import 'package:flutter/material.dart';

import '../domain/consts.dart';

class CellEmpty extends StatelessWidget{
  const CellEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.findAncestorWidgetOfExactType<MaterialApp>()?.theme?.scaffoldBackgroundColor,
          boxShadow: [
            blurShadow(
                Colors.blueGrey, 1, 0),
          ],
          border: Border.all(width: 3, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(8))
    );
  }
}