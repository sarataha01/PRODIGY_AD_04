import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tic_tac_toe/constants/text_styles.dart';

import '../../../services/game_provider.dart';
import '../widgets/custom_button.dart';

class ResetAndWinnerDisplay extends StatelessWidget {
  const ResetAndWinnerDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gameBoard = Provider.of<GameProvider>(context, listen: true);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          gameBoard.result,
          style: MyTextStyles.playerScore,
        ),
        CustomButton(
          buttonText: 'Reset Score',
          onPressed: () {
            gameBoard.resetScore();
          },
        ),
        CustomButton(
          buttonText: 'Play Again',
          onPressed: () {
            gameBoard.resetGame();
          },
        ),
      ],
    );
  }
}
