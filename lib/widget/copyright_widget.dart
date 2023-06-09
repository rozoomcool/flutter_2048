import 'package:flutter/material.dart';

import '../domain/consts.dart';

class Copyright extends StatefulWidget {
  const Copyright({super.key});

  @override
  State<Copyright> createState() => _CopyrightState();
}

class _CopyrightState extends State<Copyright> {
  bool tumb = false;
  double scale = 1;
  final year = DateTime.now().year;

  void toggle() => setState(() {
    tumb = !tumb;
    scale = 1.1;
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggle(),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 80,
        decoration: BoxDecoration(
            color: context
                .findAncestorWidgetOfExactType<MaterialApp>()
                ?.theme
                ?.scaffoldBackgroundColor,
            boxShadow: [blurShadow(neonShadowColor, neonBlur, neonSpread)],
            border: Border.all(width: 3, color: neonColor),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: AnimatedScale(
            onEnd: () => setState(() {
              scale = 1;
            }),
            scale: scale,
            duration: const Duration(milliseconds: 100),
            child: tumb
                ? Text(
                    '© rozoomcool $year',
                    style: gameCopyrightText,
                  )
                : Text(
                    '© itabrek $year',
                    style: gameCopyrightText,
                  ),
          ),
        ),
      ),
    );
  }
}
