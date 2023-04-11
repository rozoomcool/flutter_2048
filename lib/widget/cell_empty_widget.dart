import 'package:flutter/material.dart';

class CellEmpty extends StatelessWidget{
  const CellEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: const [
        //   BoxShadow(color: Colors.black54, blurRadius: 3)
        // ]
      )
    );
  }
}