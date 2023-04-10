import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final int index;

  final textStyle = const TextStyle(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);

  const Cell({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: const [
          //   BoxShadow(color: Colors.black54, blurRadius: 3)
          // ]
      ),
      child: Center(
        child: Text(
          '$index',
          style: textStyle,
        ),
      ),
    );
  }
}
