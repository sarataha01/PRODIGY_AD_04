import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tic_tac_toe/constants/text_styles.dart';

import '../../../services/game_provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gameBoard = Provider.of<GameProvider>(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'X Score',
              style: MyTextStyles.playerScore,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Text(
                gameBoard.xScore.toString(),
                key: ValueKey<int>(gameBoard.xScore),
                style: MyTextStyles.numberScore,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'O Score',
              style: MyTextStyles.playerScore,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Text(
                gameBoard.oScore.toString(),
                key: ValueKey<int>(gameBoard.xScore),
                style: MyTextStyles.numberScore,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
