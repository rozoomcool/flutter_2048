import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilesgame/domain/game_events.dart';

import '../domain/consts.dart';
import '../domain/game_bloc.dart';
import '../domain/game_state.dart';

class TabletWidget extends StatelessWidget {
  const TabletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        builder: (BuildContext context, state) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: context
                            .findAncestorWidgetOfExactType<MaterialApp>()
                            ?.theme
                            ?.scaffoldBackgroundColor,
                        boxShadow: [
                          blurShadow(neonShadowColor, neonBlur, neonSpread)
                        ],
                        border: Border.all(width: 3, color: neonColor),
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.receipt, size: 40, color: recordColor),
                            Text(
                              '${state.currentMax}',
                              style:
                                  gameTabletText.copyWith(color: recordColor),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: context
                                .findAncestorWidgetOfExactType<MaterialApp>()
                                ?.theme
                                ?.scaffoldBackgroundColor,
                            boxShadow: [
                              blurShadow(neonShadowColor, neonBlur, neonSpread)
                            ],
                            border: Border.all(width: 3, color: neonColor),
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${state.score}',
                              style: gameTabletText,
                            )),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: context
                                        .findAncestorWidgetOfExactType<
                                            MaterialApp>()
                                        ?.theme
                                        ?.scaffoldBackgroundColor,
                                    boxShadow: [
                                      blurShadow(
                                          neonShadowColor, neonBlur, neonSpread)
                                    ],
                                    border:
                                        Border.all(width: 3, color: neonColor),
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8.0),
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.undo, size: 25))),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => context.read<GameBloc>().add(GameRefreshEvent()),
                              child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: context
                                          .findAncestorWidgetOfExactType<
                                              MaterialApp>()
                                          ?.theme
                                          ?.scaffoldBackgroundColor,
                                      boxShadow: [
                                        blurShadow(
                                            neonShadowColor, neonBlur, neonSpread)
                                      ],
                                      border:
                                          Border.all(width: 3, color: neonColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.refresh, size: 25))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
