import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final int value;

  const Cell({super.key, required this.value});

  final textStyle = const TextStyle(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {

    final Color color = value == 2 ? Colors.teal : value == 4 ? Colors.green : value == 8 ? Colors.blue : Colors.indigo;

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: const [
          //   BoxShadow(color: Colors.black54, blurRadius: 3)
          // ]
      ),
      child: Center(
        child: Text(
          '$value',
          style: textStyle,
        ),
      ),
    );
  }
}
