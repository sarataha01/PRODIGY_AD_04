import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tic_tac_toe/services/game_provider.dart';

import '../../../constants/colors.dart';

class BoxBoard extends StatelessWidget {
  const BoxBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gameBoard = Provider.of<GameProvider>(context, listen: true);

    return GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          String value = gameBoard.board[index];
          Color textColor = value == 'X' ? MyColors.xColor : MyColors.oColor;

          return GestureDetector(
            onTap: () {
              gameBoard.tapped(index);
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 5, color: MyColors.mainApp),
                color: gameBoard.matchedIndexes.contains(index)
                    ? MyColors.winnerColor
                    : MyColors.primaryColor,
              ),
              duration: const Duration(milliseconds: 350),
              child: Center(
                child: Text(
                  gameBoard.board[index],
                  style: TextStyle(
                      fontSize: 80,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        });
  }
}
