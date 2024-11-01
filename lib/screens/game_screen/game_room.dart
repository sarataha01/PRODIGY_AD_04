import 'package:flutter/material.dart';

import 'components/game_board.dart';
import 'components/score_board.dart';
import 'components/timer_and_winner_display.dart';

class GameRoom extends StatelessWidget {
  const GameRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ScoreBoard(),
            ),
            Expanded(
              flex: 3,
              child: BoxBoard(),
            ),
            Expanded(
              flex: 2,
              child: ResetAndWinnerDisplay(),
            ),
          ],
        ),
      ),
    );
  }
}
